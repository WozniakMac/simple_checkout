class PromotionalRules
  def initialize(product_rules, basket_rules)
    @product_rules = product_rules || []
    @basket_rules = basket_rules || []
  end

  def discount(basket)
    product_discount_value = product_discount(basket)
    basket_discount_value = basket_discount(basket.value - product_discount_value)

    product_discount_value + basket_discount_value
  end

  private

  def product_discount(basket)
    @product_rules.map { |rule| rule.discount(basket) }.sum
  end

  def basket_discount(basket_value)
    @basket_rules.map { |rule| rule.discount(basket_value) }.sum
  end
end
