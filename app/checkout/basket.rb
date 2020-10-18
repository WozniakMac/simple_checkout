class Basket
  def initialize
    @products = {}
  end

  def add(product)
    @products[product.code] ||= []
    @products[product.code] << product
  end

  def count(code)
    products(code).count
  end

  def products(code)
    @products[code] || []
  end

  def value
    @products.values.flatten.map { |product| product.price }.sum
  end
end
