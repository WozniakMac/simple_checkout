class PercentageFromValueRule
  def initialize(minimum_value, percentage)
    @minimum_value = Money.new(minimum_value, Config::CURRENCY)
    @percentage = percentage
  end

  def discount(basket_value)
    if basket_value < @minimum_value
      Money.new(0, Config::CURRENCY)
    else
      basket_value * (@percentage.to_f / 100)
    end
  end
end
