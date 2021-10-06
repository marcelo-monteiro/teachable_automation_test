# frozen_string_literal: true

# Module to configure browser Window in tests sessions
module HookWindowConfig
  def get_window_webdriver_config(driver)
    window = driver.browser.manage.window

    driver.options[:clear_local_storage]   = true
    driver.options[:clear_session_storage] = true

    window.resize_to(1366, 768)
  end
end
