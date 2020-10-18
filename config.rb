require "money"
require "byebug"

Money.locale_backend = :currency
Money.rounding_mode = BigDecimal::ROUND_DOWN

class Config
  CURRENCY = "GBP"
end
