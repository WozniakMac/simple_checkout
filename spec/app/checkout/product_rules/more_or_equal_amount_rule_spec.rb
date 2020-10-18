require "spec_helper"
require_relative "../../../../app/checkout/product_rules/more_or_equal_amount_rule"
require_relative "../../../../app/checkout/basket"
require_relative "../../../../app/checkout/product"

describe MoreOrEqualAmountRule do
  describe "#discount" do
    subject { described_class.new(product_code, amount, discounted_price).discount(basket) }

    let(:product_code) { "001" }
    let(:amount) { 2 }
    let(:discounted_price) { 850 }

    context "when minimum amount is not reached" do
      let!(:basket) { Basket.new }

      before do
        basket.add(Product.new(product_code, "Lavender heart", 925))
      end

      it "returns 0 GBP discount" do
        expect(subject).to eq(Money.new(0, Config::CURRENCY))
      end
    end

    context "when minimum amount is reached" do
      let!(:basket) { Basket.new }

      before do
        basket.add(Product.new(product_code, "Lavender heart", 925))
        basket.add(Product.new(product_code, "Lavender heart", 925))
      end

      it "returns 1.50 GBP discount" do
        expect(subject).to eq(Money.new(150, Config::CURRENCY))
      end
    end
  end
end
