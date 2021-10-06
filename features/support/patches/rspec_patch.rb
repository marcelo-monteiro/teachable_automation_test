# frozen_string_literal: true

# Deal with 'all' method exception when including rspec and capybara at the same class/module
module RSpec
  module Matchers
    # @example
    # changed from expect([1, 3, 5]).to all( be_odd.and be_an(Integer) )
    # to expect([1, 3, 5]).to em_all( be_odd.and be_an(Integer) )
    def em_all(expected)
      BuiltIn::All.new(expected)
    end
  end
end
