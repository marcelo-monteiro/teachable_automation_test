require 'rspec'
require 'yaml'
require 'pry'
require 'capybara/cucumber'
require 'faker'
require 'ffaker'
require 'selenium-webdriver'
require 'png_quantizator'
require_relative "./modules/automation_core"

#Optional argument, if not specified will search path.
webdriver_custom_path = '/Users/marcelo.monteiro/Downloads/chromedriver'
Selenium::WebDriver::Chrome::Service.driver_path =  webdriver_custom_path

if ENV['chrome']
  Capybara.default_driver = :chrome
  Capybara.register_driver :chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new(args:
    %w[incognito no-sandbox])
    Capybara::Selenium::Driver.new(app,
                                   browser: :chrome,
                                   options: options)
  end
elsif ENV['chrome_headless']
  Capybara.default_driver = :chrome
  Capybara.register_driver :chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new(args:
      %w[headless disable-gpu incognito no-sandbox])
    Capybara::Selenium::Driver.new(app, browser: :chrome,
                                        options: options)
  end
elsif ENV['firefox']
  Capybara.default_driver = :firefox
  Capybara.register_driver :firefox do |app|
    Capybara::Selenium::Driver.new(app, browser: :firefox)
  end
else
  Capybara.default_driver = :selenium
end

Capybara.default_selector = :xpath
Capybara.default_max_wait_time = 15
Capybara.threadsafe = true

DICTIONARY_PATH = "#{Dir.pwd}/data/elements.yml".freeze