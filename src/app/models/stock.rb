require 'app/models/transaction'
require 'db/config'


class Stock < ActiveRecord::Base
  PRICEFLUX = 0.8..1.6

  def self.buy(ticker, amount)
    amount = amount.to_i
    stock = find_by(ticker: ticker)
    current_money = Transaction.calculate_money

    raise 'Not enough money' if stock.price * amount > current_money
    raise 'Not enough shares remain' if stock.quantity < amount

    stock.quantity -= amount
    portfolio_stock = Trade.find_by(stock_id: ticker)
    if portfolio_stock.nil?
      Trade.create(stock_id: ticker, quantity: amount)
    else
      portfolio_stock.quantity += amount
    end
    Transaction.create(stock_id: ticker, quantity: amount, price: stock.price, is_buy: true)
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
      Transaction.create(stock_id: ticker, quantity: amount, price: stock.price, is_buy: false)
    end
    stock.save
  end

  def self.update_stocks
    Stock.all.each do |stock|
      old_price = stock.price
      new_price = (old_price * rand(PRICEFLUX)).round(2)
      delta_price = (new_price-old_price).round(2)
      stock.update(price: new_price, delta: delta_price)
    end
  end


  def to_s
    color = "red"

    "Stock: #{name}, Ticker: #{ticker}, Quantity: #{quantity}, Price: #{price}, Movement: #{delta}.#{color}"
  end

end
