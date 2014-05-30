$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'app/stock_exchange'

StockExchange.new ARGV