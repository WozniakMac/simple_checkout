# Simple ruby checkout

## Requirements

Ruby 2.7.1

bundler

## Installation

    gem install bundler
    bundle install

## Installation

    bundle exec rspec

## Usage

```ruby
product_1 = Product.new("001", "Lavender heart", 925)
product_2 = Product.new("002", "Personalized cufflinks", 4500)
product_3 = Product.new("003", "Kids T-shirt", 1995)

product_rules = [MoreOrEqualAmountRule.new("001", 2, 850)]
basket_rules = [PercentageFromValueRule.new(6000, 10)]

promotional_rules = PromotionalRules.new(product_rules, basket_rules)
checkout = Checkout.new(promotional_rules)
checkout.scan(product_1)
checkout.scan(product_2)
checkout.scan(product_1)
checkout.scan(product_3)
checkout.total
```
