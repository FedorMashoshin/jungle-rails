require "rails_helper"

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new
    end
    it 'Product with all four fields set will indeed save successfully' do  
      @product = Product.new(name:"test", quantity:"320", price:"100", category:@category)
      expect(@product.save).to be true
    end 

    it 'Validates if there is a name field' do
      @product = Product.new(name: nil, quantity:"320", price:"100", category:@category )
      expect(@product.errors.full_messages).to be_instance_of Array
    end

    it 'Validates if there is a quantity field' do
      @product = Product.new(name: 'test', quantity:nil, price:"100", category:@category )
      expect(@product.errors.full_messages).to be_instance_of Array
    end

    it 'Validates if there is a price field' do
      @product = Product.new(name: 'test', quantity:"320", price:nil, category:@category )
      expect(@product.errors.full_messages).to be_instance_of Array
    end

    it 'Validates if there is a category field' do
      @product = Product.new(name: 'test', quantity:"320", price:"100", category:nil )
      expect(@product.errors.full_messages).to be_instance_of Array
    end
  end
end