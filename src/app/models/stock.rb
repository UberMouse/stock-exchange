require_relative '../../db/config'
require 'pry'
require 'pry-byebug'

class Stock < ActiveRecord::Base

  def self.buy(ticker, amount)
    binding.pry
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

end
