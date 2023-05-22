require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, item_id: item.id, user_id: user.id)
  end

  describe '商品購入' do
    context '商品を購入できる' do
      it '全ての項目が正しく入力されている' do
        expect(@purchase_shipping).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @purchase_shipping.building = ""
        expect(@purchase_shipping).to be_valid
      end
    end

    context '商品を購入できない' do
      it 'tokenが生成されていない' do
        @purchase_shipping.token = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空' do
        @purchase_shipping.postal_code = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefucture_idが1'  do
        @purchase_shipping.prefecture_id = 1
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空' do
        @purchase_shipping.city = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空' do
        @purchase_shipping.address = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空' do
        @purchase_shipping.phone = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone can't be blank")
      end
      it 'postal_codeが全角数字' do
        @purchase_shipping.postal_code = "１２３-４５６７"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_codeにハイフンがない' do
        @purchase_shipping.postal_code = '1234567'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code is invalid")
      end
      it 'phoneに数字以外が含まれる' do
        @purchase_shipping.phone = "010-1234-5678"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneがが9字以下' do
        @purchase_shipping.phone = "123456789"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneがが12字以上' do
        @purchase_shipping.phone = "000123456789"
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone is invalid")
      end
      it 'userが紐づいていない' do
        @purchase_shipping.user_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていない' do
        @purchase_shipping.item_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
