require 'active_record'

class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :stock_id
      t.integer :quantity
      t.integer :price
      t.boolean :is_buy
    end
  end
end