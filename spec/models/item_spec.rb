require 'rails_helper'
describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報入力' do
     context '商品登録できる場合' do
      it "item_nameとuser_idとitem_nameとdescriptionとcategory_idとcondition_idとprefecture_idとshipping_date_idとshipping_charge_idとpriceがあれば登録できる" do
         expect(@item).to be_valid
      end
    end
    context '商品情報入力がうまくいかないとき' do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameが空だと出品できない" do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "descriptionが空だと出品できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end 
      it "category_idが空だと出品できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is invalid")
      end 
      it "condition_idが空だと出品できない" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is invalid")
      end 
      it "prefecture_idが空だと出品できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is invalid")
      end
      it "shipping_date_idが空だと出品できない" do
        @item.shipping_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date is invalid")
      end
      it "shipping_charge_idが空だと出品できない" do
        @item.shipping_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge is invalid")
      end
      it "priceが空だと出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが全角数字だと出品できない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "priceが299以下の場合は保存できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
        it "値段が9999999より大きかった時に出品できないこと" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end
  end
end