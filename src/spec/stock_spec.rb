require_relative '../app/stock_exchange'


describe StockExchange do

  describe 'list' do
    it 'should send get_all_stocks method to stock service' do
      StockService.any_instance.should_receive(:get_all_stocks)
      StockExchange.new(['list'])
    end

    it 'should be the default command' do
      expect{StockExchange.new []}.to_not raise_error
    end
  end



end
