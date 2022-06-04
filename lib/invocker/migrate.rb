mode = ENV.fetch("mode")

class CommandTable < ActiveRecord::Migration[5.2]
  def change
    create_table :commands do |table|
    table.string :key
    table.string :command
    table.timestamps
    end
  end
end
CommandTable.migrate(:up) if mode == "create"
CommandTable.migrate(:down) if mode == "drop"
