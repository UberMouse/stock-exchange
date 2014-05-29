class StockService

  def initialize
    @stocks = [
        Stock.new(1, 'Xero', 'XRO', 1000, 12),
        Stock.new(2, 'Apple', 'AAPL', 100, 421),
        Stock.new(3, 'Google', 'GOOG', 10000, 863),
        Stock.new(4, 'McDonalds', 'MCD', 5000, 2),
    ]
    @portfolio = []
  end

  def get_all_stocks
    @stocks
  end

  def get_stock(id)
    @stocks.find{|s| s.id == id}
  end

  def get_portfolio_stock(id)

  end

  # def buy_stock(id, amount)
  #   stock = get_stock(id)
  #   stock.quantity -= amount
  #   if get_portfolio_stock(id).nil?
  #     @portfolio << Trade.new(@portfolio.length, id, amount)
  #   end
  # end
  #
  # def sell_stock(id, amount)
  #   stock = get_stock(id)
  #   stock.quantity += amount
  #   @portfolio << Trade.new(id, amount)
  # end

  def get_portfolio

  end
end

class Stock
  attr_reader :id
  attr_accessor :name, :ticker, :quantity, :price

  def initialize(id, name, ticker, quantity, price)
    @price = price
    @name = name
    @ticker = ticker
    @quantity = quantity
    @id = id
  end

end

class Trade
  attr_reader :id, :stock_list_id
  attr_accessor :quantity

  def initialize(id, stock_list_id, quantity)
    @stock_list_id = stock_list_id
    @quantity = quantity
    @id = id
  end
end