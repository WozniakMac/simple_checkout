class Product
  attr_reader :code, :name, :price

  def initialize(code, name, price)
    @code = code
    @name = name
    @price = Money.new(price, Config::CURRENCY)
  end
end
