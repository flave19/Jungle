require 'rails_helper'

RSpec.describe Product, type: :model do
  category = Category.create(name: "Technology")
  product = category.products.create({
    name: 'rubber duck',
    quantity: 2,
    price: 200
  })

  describe 'Validations' do

    it "is valid with valid attributes" do
      category = Category.new(name: "Gym Clothes")
      product = Product.new(name: "Gym shoes", price: 23.00, quantity: 1, category: category)
      expect(product).to be_valid
    end

    it "is not valid without name" do
      product.name = nil
      expect(product).to_not be_valid
    end

    it "is not valid without a price" do
      product.price = nil
      expect(product).to_not be_valid

    end

    it "is not valid without quantity" do
      product.quantity = nil
      expect(product).to_not be_valid

    end

    it "it is not valid without category" do
      test_product = Product.new(name: "Video Game", price: 50.00, quantity: 1, category: nil)
      expect(test_product).to_not be_valid

    end
  end
end