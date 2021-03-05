require 'rails_helper'

RSpec.describe PurchaseInformation, type: :model do
  before do
    @purchase_information = FactoryBot.build(:purchase_information)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@purchase_information).to be_valid
      end
      it 'building_nameは空でも登録できる' do
        @purchase_information.building_name = ""
        expect(@purchase_information).to be_valid
      end
    end
    context '商品購入できないとき' do
      it "tokenが空では登録できないこと" do
        @purchase_information.token = nil
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Token can't be blank")
      end
      it 'postalcodeが空では登録できない' do
        @purchase_information.postalcode = ''
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Postalcode can't be blank")
      end
      it 'postalcodeに-(ハイフン)が存在しなければ登録できない' do
        @purchase_information.postalcode = '1234567'
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Postalcode Please enter 3 single-byte numbers, hyphens, and 4 single-byte numbers")
      end
      it 'postalcodeが半角数字３文字-半角数字４文字以外では登録できない' do
        @purchase_information.postalcode = '1234−567'
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Postalcode Please enter 3 single-byte numbers, hyphens, and 4 single-byte numbers")
      end
      it 'postalcodeが半角数字３文字-半角数字４文字以外では登録できない' do
        @purchase_information.postalcode = 'aaa-aaaa'
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Postalcode Please enter 3 single-byte numbers, hyphens, and 4 single-byte numbers")
      end
      it 'areaを選択しないと登録できない' do
        @purchase_information.area_id = 1
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Area Please select")
      end
      it 'municipalityが空では登録できない' do
        @purchase_information.municipality = ''
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では登録できない' do
        @purchase_information.address = ''
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @purchase_information.phone_number = ''
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数字以外登録できない' do
        @purchase_information.phone_number = '０９０１２３４５６７８'
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Phone number Please enter only half-width numbers")
      end
      it 'phone_numberが半角数字以外登録できない' do
        @purchase_information.phone_number = 'あああああああああああ'
        @purchase_information.valid?
        expect(@purchase_information.errors.full_messages).to include("Phone number Please enter only half-width numbers")
      end
    end
  end
end
