require 'db/config'

class AddPriceChangeToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :delta, :float
  end
end
