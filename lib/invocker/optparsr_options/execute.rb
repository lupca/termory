module Invocker 
  module OptpareOptions
    class Configs
      def self.define(parser, script_options)
        return unless script_options.execute
      end
    end
  end
end