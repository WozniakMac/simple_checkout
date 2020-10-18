require "spec_helper"
require_relative "../../app/checkout/product"

describe Product do
  let(:code) { "001" }
  let(:name) { "Product 1" }
  let(:price) { 1000 }

  before do
    described_class.delete_all
  end

  describe ".create" do
    it "creates new product and add it to list" do
      expect { described_class.create(code, name, price) }.to change { Product.count }.by(1)
    end
  end

  describe ".find" do
    let!(:product) { described_class.create(code, name, price) }

    it "finds product in the list" do
      expect(described_class.find(code)).to eq(product)
    end
  end
end
