# frozen_string_literal: true

require 'cucumber/glue/invoke_in_world'

module Capybara
  module DSL
    def type_text(selector, text: nil)
      return false if text.nil?

      text.split('').each { |char| find(selector).native.send_keys(char) }
    end
  end
end

class Session
  include Capybara::SessionMatchers
  def within(*args, **kw_args)
    new_scope = args.first.respond_to?(:to_capybara_node) ? args.first.to_capybara_node : find(*args, **kw_args)
    begin
      scopes.push(new_scope)
      yield if block_given?
    ensure
      scopes.pop
    end
  end
  alias within_element within
end

module Capybara
  class Session
    include Capybara::SessionMatchers
    def within(*args, **kw_args)
      new_scope = args.first.respond_to?(:to_capybara_node) ? args.first.to_capybara_node : find(*args, **kw_args)
      begin
        scopes.push(new_scope)
        $within_scope = true
        yield if block_given?
      ensure
        scopes.pop
        $within_scope = false
      end
    end
    alias within_element within
  end
end

module Capybara
  module Queries
    class SelectorQuery < Queries::BaseQuery
      def initialize(*args,
                     session_options:,
                     enable_aria_label: session_options.enable_aria_label,
                     test_id: session_options.test_id,
                     selector_format: nil,
                     order: nil,
                     **options,
                     &filter_block)

        arg_selector = args[0].is_a?(Symbol) ? args[-1] : args[0]
        arg_index = args.index(arg_selector)
        if defined?(DICTIONARY_PATH)
          data = File.read(DICTIONARY_PATH)
          elements = YAML.safe_load(data)
          elements = (elements.to_a.flatten.select { |item| item.is_a?(Hash) }).reduce(:merge)
          args[arg_index] = elements[args[arg_index]] if elements.keys.include?(args[arg_index])
        end

        args[arg_index] = ".#{args[arg_index]}" if $within_scope && args[arg_index][0] != '.'

        @resolved_node = nil
        @resolved_count = 0
        @options = options.dup
        @order = order
        @filter_cache = Hash.new { |hsh, key| hsh[key] = {} }

        super(@options)
        self.session_options = session_options

        @selector = Selector.new(
          find_selector(args[0].is_a?(Symbol) ? args.shift : args[0]),
          config: { enable_aria_label: enable_aria_label, test_id: test_id },
          format: selector_format
        )

        @locator = args.shift
        @filter_block = filter_block

        raise ArgumentError, "Unused parameters passed to #{self.class.name} : #{args}" unless args.empty?

        @expression = selector.call(@locator, **@options)

        warn_exact_usage

        assert_valid_keys
      end
    end
  end
end
