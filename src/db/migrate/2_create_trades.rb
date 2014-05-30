require 'db/config'

class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |c|
      c.integer :stock_id
      c.integer :quantity

      c.timestamps
    end
  end
end
