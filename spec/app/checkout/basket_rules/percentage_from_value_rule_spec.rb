require "spec_helper"
require_relative "../../../../app/checkout/basket_rules/percentage_from_value_rule"

describe PercentageFromValueRule do
  describe "#discount" do
    subject { described_class.new(minimum_value, percentage).discount(basket_value) }

    let(:percentage) { 10 }
    let(:basket_value) { Money.new(10000, Config::CURRENCY) }

    context "when minimum value is not reached" do
      let(:minimum_value) { Money.new(11000, Config::CURRENCY) }

      it "returns 0 GBP discount" do
        expect(subject).to eq(Money.new(0, Config::CURRENCY))
      end
    end

    context "when minimum value is reached" do
      let(:minimum_value) { Money.new(10000, Config::CURRENCY) }

      it "returns 10 GBP discount" do
        expect(subject).to eq(Money.new(1000, Config::CURRENCY))
      end
    end
  end
end
