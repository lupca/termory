require 'invocker/db'
require 'invocker/optpare'
require 'invocker/model'

module Invocker
  class Console

    def initialize
      invocker = Invocker::OptparsrInvocker.new
      @options = invocker.parse(ARGV)
    end

    def start
      configs if @options.config
      executes if @options.execute
      Invocker::Database.create if @options.database == :create
      Invocker::Database.drop if @options.database == :drop
    end

    private

    def configs
      alias_key = @options.config_message
      key = alias_key.gsub "alias.", ''

      case @options.config_type
      when 'create'
        command = ARGV[1]
        Invocker::Model::Command.create key: key, command: command
        puts "Done!"
      when 'delete'
        command = Invocker::Model::Command.find_by(key: key)
        return puts 'Not thing unset' if command.blank?

        command.destroy
      when 'list'
        puts "num  | id | key          | command"
        Invocker::Model::Command.all.each_with_index do |command, num|
          puts "#{num + 1}.   |   #{command.id}  | #{command.key} | #{command.command}"
        end
      end
    end

    def executes
      # alias_key = @options.config_message
      # puts alias_key
      # key = alias_key.gsub "alias.", ''
      # puts ARGV
      command = Invocker::Model::Command.find_by(key: ARGV[1])
      exec command.command
    end
  end
end
