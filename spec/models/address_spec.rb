require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '購入機能' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end
      it 'buildingは空でも保存できること' do
      end
    end
    context '内容に問題がある場合' do
      it 'postal_code_idが空だと保存できないこと' do
      end
      it 'postal_code_idが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      end
      it 'area_idを選択していないと保存できないこと' do
      end
      it 'cityは空では保存できないこと' do
      end
      it 'phonenumberは空では保存できないこと' do
      end
      
      it 'purchaserが紐付いていないと保存できないこと' do
      end

    end 
  end
end
