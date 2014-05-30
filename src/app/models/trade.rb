require 'active_record'

class Trade < ActiveRecord::Base
  def sell
    Stock.sell(stock_id, quantity)
  end

  def to_s
    "Stock ticker: #{stock_id}, Quantity: #{quantity}"
  end
end
