class Account
  attr_accessor :name, :balance

  def initialize(name, balance)
    @name = name
    @balance = balance
  end

  def <=>(other)
    balance <=> other.balance
  end
end

class Portfolio
  include Enumerable

  def initialize
    @accounts = []
  end

  def each(&block)
    @accounts.each(&block)
  end

  def add_account(account)
    @accounts << account
  end
end

portfolio = Portfolio.new
portfolio.add_account Account.new('Mc Donalds', 500)
portfolio.add_account Account.new('Burger King', 200)

puts portfolio.min.balance
puts portfolio.max.balance
