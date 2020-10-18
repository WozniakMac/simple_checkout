class MoreOrEqualAmountRule
  def initialize(product_code, amount, discounted_price)
    @product_code = product_code
    @amount = amount
    @discounted_price = Money.new(discounted_price, Config::CURRENCY)
  end

  def discount(basket)
    return Money.new(0, Config::CURRENCY) if basket.count(@product_code) < @amount

    basket.products(@product_code).map { |product| product.price - @discounted_price }.sum
  end
end
