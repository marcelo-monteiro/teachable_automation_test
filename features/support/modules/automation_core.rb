# frozen_string_literal: true

require_relative '../patches/rspec_patch'
require_relative './helpers/scroll_helper'
require_relative './factories/generate_user_data'

# Module that deals with elements assignment
module AutomationCore
  # Include should be done with RSpec first, and just then Capybara to avoid within methods override
  include RSpec::Matchers
  include Capybara::DSL
  include Cucumber::Glue::ProtoWorld
  include ScrollHelper
  include GenerateUserData

  def ajax_waiter
    assert_none_of_selectors('', '', wait: 25)
  end

  def selenium_actions
    page.driver.browser.action
  end

  def digit_by_digit(element, text)
    text.chars.each do |char|
      find(element).native.send_keys(char)
    end
  end

  def fill_form(type_of_data)
    type_of_data.each do |key, value|
      find(key.to_s.delete(':'), wait: 5).set(value)
    end
  end
end
