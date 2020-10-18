require "spec_helper"
require_relative "../../app/checkout"
require_relative "../../app/checkout/promotional_rules"
require_relative "../../app/checkout/product"
require_relative "../../app/checkout/product_rules/more_or_equal_amount_rule"
require_relative "../../app/checkout/basket_rules/percentage_from_value_rule"

describe Checkout do
  subject { described_class.new(promotional_rules) }

  let(:promotional_rules) do
    PromotionalRules.new(product_rules, basket_rules)
  end

  let(:product_rules) { [MoreOrEqualAmountRule.new("001", 2, 850)] }
  let(:basket_rules) { [PercentageFromValueRule.new(6000, 10)] }

  let(:product_1) { Product.new("001", "Lavender heart", 925) }
  let(:product_2) { Product.new("002", "Personalized cufflinks", 4500) }
  let(:product_3) { Product.new("003", "Kids T-shirt", 1995) }

  describe "#total" do
    context "with only basket rule triggered" do
      it "calculate price correctly" do
        subject.scan(product_1)
        subject.scan(product_2)
        subject.scan(product_3)

        expect(subject.total).to eq(Money.new(6678, Config::CURRENCY))
      end
    end

    context "with only product rule triggered" do
      it "calculate price correctly" do
        subject.scan(product_1)
        subject.scan(product_3)
        subject.scan(product_1)

        expect(subject.total).to eq(Money.new(3695, Config::CURRENCY))
      end
    end

    context "with product and basket rule triggered" do
      it "calculate price correctly" do
        subject.scan(product_1)
        subject.scan(product_2)
        subject.scan(product_1)
        subject.scan(product_3)

        expect(subject.total).to eq(Money.new(7376, Config::CURRENCY))
      end
    end
  end
end
