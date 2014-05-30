require_relative '../config'

class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |c|
      c.string :ticker, :limit => 3
      c.string :name
      c.float :price
      c.integer :quantity

      c.timestamps
    end
  end

end
