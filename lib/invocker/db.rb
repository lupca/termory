module Invocker
  require 'active_record'
  require 'sqlite3'
  require 'invocker/config'

  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: Invocker::Config::DATABASE_HOST)
  class Database
    class << self
      def create
        ENV["mode"] = 'create'
        require 'invocker/migrate'
      end

      def drop
        ENV["mode"] = 'drop'
        require 'invocker/migrate'
      end
    end
  end
end
