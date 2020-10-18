require "spec_helper"
require_relative "../../../app/checkout/promotional_rules"
require_relative "../../../app/checkout/basket"
require_relative "../../../app/checkout/product"
require_relative "../../../app/checkout/product_rules/more_or_equal_amount_rule"
require_relative "../../../app/checkout/basket_rules/percentage_from_value_rule"

describe PromotionalRules do
  subject { described_class.new(product_rules, basket_rules) }

  let(:product_1) { Product.new("001", "Lavender heart", 925) }
  let(:product_2) { Product.new("002", "Personalized cufflinks", 4500) }
  let(:product_3) { Product.new("003", "Kids T-shirt", 1995) }

  let(:basket) { Basket.new }

  before do
    basket.add(product_1)
    basket.add(product_1)
    basket.add(product_2)
    basket.add(product_2)
    basket.add(product_2)
    basket.add(product_3)
  end

  describe "#discount" do
    context "with discount rules" do
      let(:product_rules) do
        [
          MoreOrEqualAmountRule.new("001", 2, 900),
          MoreOrEqualAmountRule.new("002", 3, 4400)
        ]
      end

      let(:basket_rules) do
        [
          PercentageFromValueRule.new(10000, 10)
        ]
      end

      it "calculate correct discount" do
        expect(subject.discount(basket)).to eq(Money.new(2049, Config::CURRENCY))
      end
    end

    context "with no discount rules" do
      let(:product_rules) { [] }
      let(:basket_rules) { [] }

      it "calculate correct discount" do
        expect(subject.discount(basket)).to eq(Money.new(0, Config::CURRENCY))
      end
    end
  end
end
