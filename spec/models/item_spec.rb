require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品を保存できる' do
      it '全ての情報が正しく入力されている' do
      end
    end
    context '商品を保存できない' do
      it 'imageが空' do
      end
      it 'item_nameが空' do
      end
      it 'item_nameが40字より多い' do
      end
      it 'introduceが空' do
      end
      it 'introduceが1,000字より多い' do
      end
      it 'category_idに1が入っている' do
      end
      it 'condition_idに1が入っている' do
      end
      it 'charge_bearer_idに1が入っている' do
      end
      it 'prefecture_idに1が入っている' do
      end
      it 'shipping_date_idに1が入っている' do
      end
      it 'priceが空' do
      end
      it 'priceが300未満' do
      end
      it 'priceが10,000,000以上' do
      end
      it 'ユーザーが紐づいていない' do
      end
    end
  end
end
