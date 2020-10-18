require_relative "../config"
require_relative "./checkout/basket"

class Checkout
  def initialize(promotional_rules)
    @promotional_rules = promotional_rules
    @basket = Basket.new
  end

  def scan(product)
    @basket.add(product)
  end

  def total
    @basket.value - @promotional_rules.discount(@basket)
  end
end
