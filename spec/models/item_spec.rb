require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品を保存できる' do
      it '全ての情報が正しく入力されている' do
        expect(@item).to be_valid
      end
    end
    context '商品を保存できない' do
      it 'imageが空' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_nameが40字より多い' do
        @item.item_name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name is too long (maximum is 40 characters)")
      end
      it 'introduceが空' do
        @item.introduce = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduce can't be blank")
      end
      it 'introduceが1,000字より多い' do
        @item.introduce = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduce is too long (maximum is 1000 characters)")
      end
      it 'category_idに1が入っている' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idに1が入っている' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'charge_bearer_idに1が入っている' do
        @item.charge_bearer_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge bearer can't be blank")
      end
      it 'prefecture_idに1が入っている' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_date_idに1が入っている' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it 'priceが空' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが300未満' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 299")
      end
      it 'priceが10,000,000以上' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      it 'priceに全角数字が入っている' do
        @item.price = "１２３４"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceに数字以外が入っている' do
        @item.price = "abcd"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'ユーザーが紐づいていない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
