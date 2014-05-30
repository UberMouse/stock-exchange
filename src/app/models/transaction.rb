require 'active_record'

class Transaction < ActiveRecord::Base
  STARTING_MONEY = 50_000

  def self.calculate_money
    money = STARTING_MONEY
    all.each do |t|
      method = (t.is_buy) ? :- : :+
      money = money.send(method, t.quantity * t.price)
    end
    money.round(2)
  end
end