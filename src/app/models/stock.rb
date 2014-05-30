require_relative '../../db/config'

class Stock < ActiveRecord::Base

  PRICEFLUX = 0.8..1.6

  def self.buy(ticker, amount)
    amount = amount.to_i
    stock = find_by(ticker: ticker)
    stock.quantity -= amount
    portfolio_stock = Trade.find_by(stock_id: ticker)
    if portfolio_stock.nil?
      Trade.create(stock_id: ticker, quantity: amount)
    else
      portfolio_stock.quantity += amount
    end
    stock.save
  end

  def self.sell(ticker, amount)
    amount = amount.to_i
    stock = find_by(ticker: ticker)
    stock.quantity -= amount
    portfolio_stock = Trade.find_by(stock_id: ticker)
    if portfolio_stock.nil?
      raise 'you dont own dat stock nigga'
    else
      stock.quantity -= amount
      portfolio_stock.quantity -= amount
      if portfolio_stock.quantity <= 0
        portfolio_stock.delete
      end
    end
    stock.save
  end

  def to_s
    "Stock: #{name}, Ticker: #{ticker}, Quantity: #{quantity}, Price: #{price}"
  end

  def self.update_stocks
    Stock.all.each do |stock|
      price = stock.price
      new_price = (price * rand(PRICEFLUX)).round(2)
      stock.update(price: new_price)
    end
  end

end
