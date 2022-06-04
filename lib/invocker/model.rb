module Invocker
  module Model
    require 'active_record'
    require 'sqlite3'
    require 'invocker/config'

    ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: Invocker::Config::DATABASE_HOST)
    class Command < ActiveRecord::Base

    end
  end
end
