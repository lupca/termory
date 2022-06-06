module Termory
  require 'active_record'
  require 'sqlite3'
  require 'termory/config'

  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: Termory::Config::DATABASE_HOST)
  class Database
    class << self
      def create
        ENV["mode"] = 'create'
        require 'termory/migrate'
      end

      def drop
        ENV["mode"] = 'drop'
        require 'termory/migrate'
      end
    end
  end
end
