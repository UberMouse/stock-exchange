require 'db/config'

class AlterTrades < ActiveRecord::Migration
  def change
    remove_column :trades, :stock_id
    add_column :trades, :stock_id, :string
  end
end