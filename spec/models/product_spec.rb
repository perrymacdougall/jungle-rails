require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#name' do

    it 'should exist for new records' do
      @product = Product.new(
        name: 'Perry'
      )
      expect(@product.name).to be_present
    end
  end

  describe '#price' do
    it 'should exist for new records' do
      @product = Product.new(
        price: 500
      )
      expect(@product.price).to be_present
    end
  end

  describe '#quantity' do
    it 'should exist for new records' do
      @product = Product.new(
        quantity: 0
      )
      expect(@product.quantity).to be_present
    end
  end

  describe '#category' do
    it 'should exist for new records' do
      @product = Product.new(
        category_id: 1
      )
      expect(@product.category_id).to be_present
    end
  end

  describe '#all_cats' do
    it 'should pass for new records' do
      @category = Category.create!(name: "testcat")
      @product = Product.new(
        name: nil,
        price: 500,
        quantity: 12,
        category_id: @category.id
      )

      @product.valid? <-- Rails method
      # puts @product.errors.full_messages
      expect(@product).to be_valid <-- RSpec method
    end
  end

end
