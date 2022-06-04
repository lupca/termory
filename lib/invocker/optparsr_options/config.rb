module Invocker 
  module OptpareOptions
    class Executes
      def self.define(parser, script_options)
        # return unless script_options.config

        # Specifies an optional option argument
        parser.on("-c", "--create [COMMAND]", "alias.key 'your short command'", "Your config alias") do |message|
          script_options.config_message = message || ''
          script_options.config_type = 'create'
        end

        parser.on("-d", "--delete [COMMAND]", "alias.[key of command] eg: alias.ssh_10.10.10.10", "your key you want remove") do |message|
          script_options.config_message = message || ''
          script_options.config_type = 'delete'
        end

        parser.on("-l", "--list [COMMAND]", "alias.[key of command] eg: alias.ssh_10.10.10.10", "your key you want remove") do |message|
          script_options.config_message = message || ''
          script_options.config_type = 'list'
        end
      end
    end
  end
end