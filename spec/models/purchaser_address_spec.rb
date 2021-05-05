require 'rails_helper'

RSpec.describe PurchaserAddress, type: :model do

  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @purchaser = FactoryBot.build(:purchaser_address, user_id:user.id, product_id:product.id)
    sleep 0.5
  end

  describe '購入機能' do
    context '内容に問題ない場合' do
    
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchaser).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchaser.building = ''
        @purchaser.valid?
      end
    end

    context '内容に問題がある場合' do
      it 'postal_code_idが空だと保存できないこと' do
        @purchaser.postal_code_id = ''
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_code_idが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchaser.postal_code_id = '1234567'
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it 'area_idを選択していないと保存できないこと' do
        @purchaser.area_id = ''
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Area can't be blank")
      end

      it 'area_idを0に選択すると保存できないこと' do
        @purchaser.area_id = 0
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Area can't be blank")
      end

      it 'cityは空では保存できないこと' do
        @purchaser.city = ''
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("City can't be blank")
      end

      it 'phonenumberは空では保存できないこと' do
        @purchaser.phonenumber = ''
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Phonenumber can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @purchaser.token = ''
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Token can't be blank")
      end

      it 'phonenumberは12桁以上では保存できないこと' do
        @purchaser.phonenumber = '1234567890123'
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Phonenumber 電話番号は11桁以内の数値のみ保存可能なこと")
      end

      it 'user_idが空では登録できないこと' do
        @purchaser.user_id = ''
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("User can't be blank")
      end

      it 'product_idが空では登録できないこと' do
        @purchaser.product_id = ''
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Product can't be blank")
      end
    end 
  end
end
