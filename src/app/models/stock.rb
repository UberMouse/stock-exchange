require_relative '../../db/config'

class Stock < ActiveRecord::Base

  def buy(ticker, amount)
    stock = find_by(ticker: ticker)
    stock.quantity -= amount
    portfolio_stock = Trade.find_by(ticker: ticker)
    if portfolio_stock.nil?
      Trade.create(ticker: ticker, amount: amount)
    else
      portfolio_stock.quantity += amount
    end
    stock.save
  end

  def sell(ticker, amount)
    stock = find_by(ticker: ticker)
    stock.quantity -= amount
    portfolio_stock = Trade.find_by(ticker: ticker)
    if portfolio_stock.nil?
      raise 'you dont own dat stock nigga'
    else
      stock.quantity -= amount
      portfolio_stock.delete
    end
    stock.save
  end

  def to_s
    "Stock: #{name}, Ticker: #{ticker}, Quantity: #{quantity}, Price: #{price}"
  end

end
