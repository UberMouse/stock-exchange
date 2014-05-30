require 'active_record'

class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :stock_id
      t.integer :quantity
      t.float :price
      t.boolean :is_buy
    end
  end
end
