require 'faker'
require_relative '../../app/models/stock'



STOCK_QUANTITY_RANGE = 1000000..10000000

def generate_ticker
  (0..2).map {("A".."Z").to_a[rand(26)]}.join
end

def generate_stock_name
  Faker::Company.name
end

def generate_stock_price
  (rand*(100+rand*(0.5))).round(2)
end

def generate_stock_quantity
  rand(STOCK_QUANTITY_RANGE)
end


1000.times do
  Stock.create(ticker: generate_ticker, name: generate_stock_name,
               price: generate_stock_price, quantity: generate_stock_quantity)
end
