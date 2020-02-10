require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "can save with all valid attributes" do
      @category = Category.new(name: "Water Bottles")
      @product = Product.new(name: "ItemName", description: "cool thing", price: 10, quantity: 10, category: @category)    
      @product.save
      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @category = Category.new(name: "Water Bottles")
      @product = Product.new(name: nil, description: "cool thing", price: 10, quantity: 10, category: @category)    
      @product.save
      expect(@product).to_not be_valid
    end

    it "is not valid without a price" do
      @category = Category.new(name: "Water Bottles")
      @product = Product.new(name: "ItemName", description: "cool thing", price: nil, quantity: 10, category: @category)
      @product.save
      expect(@product).to_not be_valid
    end

    it "is not valid without a quantity" do
      @category = Category.new(name: "Water Bottles")
      @product = Product.new(name: "ItemName", description: "cool thing", price: 10, quantity: nil, category: @category)    
      @product.save
      expect(@product).to_not be_valid
    end

    it "is not valid without a category" do
      @product = Product.new(name: "ItemName", description: "cool thing", price: 10, quantity: 10, category: nil)    
      @product.save
      expect(@product).to_not be_valid
    end
  end
end
