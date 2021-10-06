class RetrySE
  class << self
    def self_handle
      @tries = 0
      begin
        yield
      rescue Exception => e
        puts e.to_s if ENV['debug']
        @tries += 1
        unless @tries > 3
          sleep 1
          retry
        end
      end
    end
  end
end
