require "spec_helper"
require_relative "../../../app/checkout/basket"
require_relative "../../../app/checkout/product"

describe Basket do
  subject { described_class.new }

  let(:product) { Product.new(product_code, "Lavender heart", 925) }
  let(:product_code) { "001" }

  describe "#add" do
    it "adds products to basket" do
      expect { subject.add(product) }.to change { subject.count(product_code) }.by(1)
    end
  end

  describe "#count" do
    it "count products in basket" do
      subject.add(product)
      subject.add(product)

      expect(subject.count(product_code)).to eq(2)
    end
  end

  describe "#products" do
    it "returns products list" do
      subject.add(product)
      subject.add(product)

      expect(subject.products(product_code)).to eq([product, product])
    end
  end

  describe "#value" do
    it "returns value of basket" do
      subject.add(product)
      subject.add(product)

      expect(subject.value).to eq(Money.new(1850, Config::CURRENCY))
    end
  end
end
