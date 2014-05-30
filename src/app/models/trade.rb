require 'active_record'

class Trade < ActiveRecord::Base
  def to_s
    "Stock ticker: #{stock_id}, Quantity: #{quantity}"
  end
end