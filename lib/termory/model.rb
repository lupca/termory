module Termory
  module Model
    require 'active_record'
    require 'sqlite3'
    require 'termory/config'

    ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: Termory::Config::DATABASE_HOST)
    class Command < ActiveRecord::Base

    end
  end
end
