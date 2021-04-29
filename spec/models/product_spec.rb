require 'rails_helper'

RSpec.describe Product, type: :model do

  before do
    @product = FactoryBot.build(:product)
  end
  
  describe '商品出品機能' do

    context '商品が出品できる時' do
      it '必要事項が全て入っていたら出品できる' do
        expect(@product).to be_valid
      end
    end

    context '商品が出品できない時' do
      it 'titleが空だと出品できない' do
        @product.title = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Title can't be blank")
      end

      it 'textが空だと出品できない' do
        @product.text = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Text can't be blank")
      end

      it 'imageが添付されていないと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it 'priceが空だと出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが299円以下だと出品できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが9999999円より上だと出品できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end

      it 'price半角英語だと出品できない' do
        @product.price = 'abc'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが全角文字だと出品できない' do
        @product.price = '１２３'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが半角英数混合だと出品できない' do
        @product.price = '123abc'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end


      it 'area_idが空だと出品できない' do
        @product.area_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Area is not a number")
      end

      it 'area_idが0だと出品できない' do
        @product.area_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Area must be other than 0")
      end 

      it 'delivery_day_idが空だと出品できない' do
        @product.delivery_day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery day is not a number")
      end

      it 'delivery_day_idが0だと出品できない' do
        @product.delivery_day_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery day must be other than 0")
      end

      it 'produtct_status_idが空だと出品できない' do
        @product.product_status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product status is not a number")
      end

      it 'product_status_idが0だと出品できない' do
        @product.product_status_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Product status must be other than 0")
      end

      it 'delivery_charge_idが空だと出品できない' do
        @product.delivery_charge_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery charge is not a number")
      end

      it 'delivery_charge_idが0だと出品できない' do
        @product.delivery_charge_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery charge must be other than 0")
      end


      it 'category_idが空だと出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category is not a number")
      end

      it 'category_idが0だと出品できない' do
        @product.category_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 0")
      end
    end
  end
end
