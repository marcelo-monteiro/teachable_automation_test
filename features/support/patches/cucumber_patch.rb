# frozen_string_literal: true

require 'pry'

module Cucumber
  module Glue
    class InvokeInWorld
      class << self
        def cucumber_instance_exec_in(world, check_arity, pseudo_method, *args, &block)
          # PendingHandler.improvements($tags) do
          cucumber_run_with_backtrace_filtering(pseudo_method) do
            if check_arity && !cucumber_compatible_arity?(args, block)
              world.instance_exec do
                ari = block.arity
                ari = ari.negative? ? "#{ari.abs - 1}+" : ari
                s1 = ari == 1 ? '' : 's'
                s2 = args.length == 1 ? '' : 's'
                raise ArityMismatchError, "Your block takes #{ari} argument#{s1}, but the Regexp matched #{args.length} argument#{s2}."
              end
            else
              world.instance_exec(*args, &block)
            end
          end
          # end
        end
      end
    end
  end
end

ArityMismatchError = Class.new(StandardError)
