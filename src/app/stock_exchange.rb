require './app/services/stock_service'
require 'db/config'

class StockExchange
  def initialize(args)
    command = args.shift
    command = 'list' if command.nil?
    @service = StockService.new
    # the following case statement can be replaced with this send command
    # send(command.to_sym, *args)
    case command
      when 'list'
        list
      when 'sell'
        sell *args
      when 'buy'
        buy *args
      when 'portfolio'
        show_portfolio
      when 'view_stock'
        view_stock *args
      when 'end_of_trading'
        end_of_trading
      else
        raise('Invalid Command')
    end
  end

  def buy(id, amount)
    @service.buy_stock(id, amount)
  end

  def view_stock(id)
    puts @service.get_stock(id)
  end

  def show_portfolio
    @service.get_portfolio.each do |stock|
      puts stock
    end
  end

  def sell(id, amount)
    @service.sell_stock(id, amount)
  end

  def list
    @service.get_all_stocks.each do |stock|
      puts stock
    end
  end

  def end_of_trading
    @service.update_stocks
  end
end
