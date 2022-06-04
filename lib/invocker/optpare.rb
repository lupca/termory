
require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'
require 'invocker/optparsr_options/config'
require 'invocker/optparsr_options/execute'
require 'invocker/optparsr_options/database'

module Invocker 
  class OptparsrInvocker
    Version = '1.0.0'
  
    CODES = %w[iso-2022-jp shift_jis euc-jp utf8 binary]
    CODE_ALIASES = { "jis" => "iso-2022-jp", "sjis" => "shift_jis" }
  
    class ScriptOptions
      attr_accessor :config, :config_type, :config_message, :database, :execute
  
      def initialize
        self.config = false
        self.execute = false
      end
  
      def define_options(parser)
        init_config parser
        # add additional options
        Invocker::OptpareOptions::Configs.define(parser, self)
        Invocker::OptpareOptions::Executes.define(parser, self)
        Invocker::OptpareOptions::Databases.define(parser, self)
        end_config parser
      end

      private 
      
      def init_config parser
        parser.banner = "Usage: example.rb [options]"
        parser.separator ""
        parser.separator "Specific options:"

        case ARGV.first
        when "config"
          self.config = true
        when "exec"
          self.execute = true
        end
      end

      def end_config parser
        parser.separator ""
        parser.separator "Common options:"
        # No argument, shows at tail.  This will print an options summary.
        # Try it and see!
        parser.on_tail("-h", "--help", "Show this message") do
          puts parser
          exit
        end
        # Another typical switch to print the version.
        parser.on_tail("--version", "Show version") do
          puts Version
          exit
        end
      end
    end
  
    #
    # Return a structure describing the options.
    #
    def parse(args)
      # The options specified on the command line will be collected in
      # *options*.
  
      @options = ScriptOptions.new
      @args = OptionParser.new do |parser|
        @options.define_options(parser)
        parser.parse!(args)
      end
      @options
    end
  
    attr_reader :parser, :options
  end
end