require 'app/models/stock'
require 'app/models/trade'

class StockService

  def get_all_stocks
    Stock.all
  end

  def get_stock(ticker)
    Stock.find_by(ticker: ticker)
  end

  def get_portfolio_stock(ticker)
    Trade.find_by(stock_list_id: ticker)
  end

  def buy_stock(id, amount)
    Stock.buy(id, amount)
  end

  def sell_stock(id, amount)
    Stock.sell(id, amount)
  end

  def get_portfolio
    Trade.all
  end
end