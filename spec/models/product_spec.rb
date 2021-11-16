require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'is valid with valid attributes' do
      @category = Category.create
      @product = Product.new(name: 'test', price: 1000, quantity: 10, category: @category)
      expect(@product).to be_valid
    end
    it 'is not valid without a name' do
      @category = Category.create
      @product = Product.new(name: nil, price: 1000, quantity: 10, category: @category)
      # @product.save
      # puts @product.errors.full_messages
      expect(@product).to_not be_valid
    end
    it 'is not valid without price' do
      @category = Category.create
      @product = Product.new(name: 'test', price: nil, quantity: 10, category: @category)
      expect(@product).to_not be_valid
    end
    it 'is not valid without quantity' do
      @category = Category.create
      @product = Product.new(name: 'test', price: 1000, quantity: nil, category: @category)
      expect(@product).to_not be_valid
    end
    it 'is not valid without category' do
      @category = Category.create
      @product = Product.new(name: 'test', price: 1000, quantity: 10, category: nil)
      expect(@product).to_not be_valid
    end
  end
end
