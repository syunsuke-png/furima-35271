require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができる時' do
      it '全ての値が正しく入力されれば保存できること' do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない時' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'category_idが1では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it 'status_idが1では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end
      it 'judgment_idが1では出品できない' do
        @item.judgment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Judgment must be other than 1"
      end
      it 'area_idが1では出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Area must be other than 1"
      end
      it 'days_idが1では出品できない' do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Days must be other than 1"
      end
      it 'costが空では出品できない' do
        @item.cost = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Cost can't be blank"
      end
      it 'costが全角数字だと出品できない' do
        @item.cost = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Cost is not a number"
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
      it '販売価格が299以下では出品できない' do
        @item.cost = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Cost must be greater than 299"
      end
      it '販売価格が1000000以上では出品できない' do
        @item.cost = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Cost must be less than 10000000"
      end
      it '金額は半角英語だけでは登録できないこと' do
        @item.cost = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include "Cost is not a number"
      end
      it '金額は半角英数混合では登録できないこと' do
        @item.cost = 'aaa111'
        @item.valid?
        expect(@item.errors.full_messages).to include "Cost is not a number"
      end
    end
  end
end
