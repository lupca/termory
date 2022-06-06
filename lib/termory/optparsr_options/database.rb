module Termory 
  module OptpareOptions
    class Databases
      def self.define(parser, script_options)
        # return unless script_options.execute

        options =  [:create, :drop, :upall, :downall ]
        parser.on("--db [TYPE]", options, options, "Select transfer type (create, :drop, :upall, :downall)") do |db|
          script_options.database = db
        end
      end
    end
  end
end
