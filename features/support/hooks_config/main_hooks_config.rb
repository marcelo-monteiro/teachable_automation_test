# frozen_string_literal: true

%w[
  ./screenshot
  ./window_config
].each { |dependency| require_relative dependency }

# Class to configure Hooks
class HooksConfig
  class << self
    include ScreenshotSetup
    include HookWindowConfig
  end
end
