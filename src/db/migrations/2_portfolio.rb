require_relative '../config'

class Portfolio < ActiveRecord::Migration
  def change
    create_table :portfolio do |c|
      c.integer :stock_list_id
      c.integer :quantity

      c.timestamps
    end
  end
end
