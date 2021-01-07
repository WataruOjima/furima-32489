require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '送り先情報の保存' do
    before do
      user =  FactoryBot.create(:user)
      item =  FactoryBot.create(:item)
      @order = FactoryBot.build(:order, item_id: item.id, user_id: user.id)
      sleep(0.1)
    end
    context '購入ができる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order.building = nil
        expect(@order).to be_valid
      end
    end
    context '購入ができない場合' do
      it 'zip_codeが空だと保存できないこと' do
        @order.zip_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip code can't be blank", 'Zip code is invalid. Include hyphen(-)')
      end
      it 'zip_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order.zip_code = '1111111'
        @order.valid?
        expect(@order.errors.full_messages).to include('Zip code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it 'tel_numberが全角数字だと保存できないこと' do
        @order.tel_number = '１１１１１１１１１１１'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel number Input only number')
      end
      it 'tel_numberが12桁以上だと保存できないこと' do
        @order.tel_number = '1111111111111'
        @order.valid?
        expect(@order.errors.full_messages).to include('Tel number Input only number')
      end
      it 'tokenが空では登録できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では登録できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
