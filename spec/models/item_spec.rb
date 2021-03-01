require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規投稿' do
    context '新規投稿できるとき' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが半角数字であれば登録できる' do
        @item.price = '444'
        expect(@item).to be_valid
      end
      it 'priceが300以上9,999,999以下であれば登録できる' do
        @item.price = '300'
        expect(@item).to be_valid
      end
      it 'priceが300以上9,999,999以下であれば登録できる' do
        @item.price = '9999999'
        expect(@item).to be_valid
      end
    end
    context '新規投稿できないとき' do
      it 'imageが存在しなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'product_nameが空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryを選択しないと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Please select")
      end
      it 'statusを選択しないと登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Please select")
      end
      it 'shippingを選択しないと登録できない' do
        @item.shipping_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping Please select")
      end
      it 'areaを選択しないと登録できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area Please select")
      end
      it 'estimateを選択しないと登録できない' do
        @item.estimate_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimate Please select")
      end
      it 'priceが半角数字でないと登録できない' do
        @item.price = '７７７'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Please enter a half-width number between 300 and 9,999,999")
      end
      it 'priceが半角数字でないと登録できない' do
        @item.price = 'あああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Please enter a half-width number between 300 and 9,999,999")
      end
      it 'priceが300未満だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Please enter a half-width number between 300 and 9,999,999")
      end
      it 'priceが9,999,999より大きいと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Please enter a half-width number between 300 and 9,999,999")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
