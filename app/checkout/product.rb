class Product
  @@product_db = []
  attr_accessor :code, :name, :price

  def initialize(code, name, price)
    @code = code
    @name = name
    @price = Money.new(price, Config::CURRENCY)
  end

  def self.create(code, name, price)
    product = new(code, name, price)
    @@product_db << product
    product
  end

  def self.find(code)
    @@product_db.find { |product| product.code == code }
  end

  def self.count
    @@product_db.count
  end

  def self.delete_all
    @@product_db = []
  end
end
