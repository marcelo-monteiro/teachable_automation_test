# frozen_string_literal: true

require 'png_quantizator'
require 'open3'
# frozen_string_literal: false

# Module to configure screenshot
module ScreenshotSetup
  include Capybara::DSL

  def take_screenshot(scenario)
    date = Time.now.getlocal('-03:00').strftime('%Y/%b/%d')
    time = Time.now.getlocal('-03:00').strftime('%H-%M-%S')
    scn_name   = format_name(scenario.name)
    screenshot = if scenario.failed?
                   "#{Dir.pwd}/data/screenshots/failure/#{date}/#{scn_name}/#{time}.png"
                 else
                   "#{Dir.pwd}/data/screenshots/success/#{date}/#{scn_name}/#{time}.png"
                 end

    return nil if alert_present?

    save_screenshot(screenshot)
    output, = Open3.capture2('which pngquant')
    unless output.empty?
      begin
        puts 'Screenshot optimized!' if ENV['debug']
        file = PngQuantizator::Image.new(screenshot)
        file.quantize_to(screenshot)
      rescue Exception => e
        puts(e.to_s)
      end
    end
    screenshot
    image = open(screenshot, 'rb', &:read)
    encoded_img = Base64.encode64(image)
  end

  private

  def alert_present?
    page.driver.browser.switch_to.alert
    true
  rescue StandardError
    false
  end

  def format_name(string)
    string.gsub!(/[çÇ]/, 'c')
    string.gsub!(/[ãâáàÃÂÁÀ]/, 'a')
    string.gsub!(/[ẽêéèẼÊÉÈ]/, 'e')
    string.gsub!(/[ĩîíìĨÎÍÌ]/, 'i')
    string.gsub!(/[õôóòÕÔÓÒ]/, 'o')
    string.gsub!(/[ũûúùŨÛÚÙ]/, 'u')
    string.gsub!(/[!@#$%^&*(),?":{}|<>]/, '_')
    string.gsub!(/([_@#!%()\-=;><,{}~\[\]?"*\^$+\s\-]+)/, '_')
    string
  end
end
