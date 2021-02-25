require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録'  do
    context '新規登録できるとき' do
      it 'すべての項目が存在すれば登録できる' do
      end
      it 'emailに@が含まれていれば登録できる' do
      end
      it 'emailが重複していなければ登録できる' do
      end
      it 'passwordとpassword_confirmationが6文字以上入力されていれば登録できる' do
      end
      it 'passwordとpassword_confirmationが半角英数字混合であれば登録できる' do
      end
      it 'lastnameが全角（漢字・ひらがな・カタカナ）で入力されていれば登録できる' do
      end
      it 'firstnameが全角（漢字・ひらがな・カタカナ）で入力されていれば登録できる' do
      end
      it 'last_furiganaが全角（カタカナ）で入力されていれば登録できる' do
      end
      it 'first_furiganaが全角（カタカナ）で入力されていれば登録できる' do
      end
      it 'birthdayが入力されていれば登録できる' do
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
      end
      it 'emailが空では登録できない' do
      end
      it 'emailに@が含まれていないと登録できない' do
      end
      it 'emailが重複すると登録できない' do
      end
      it 'passwordが空だと登録できない' do
      end
      it 'passwordが5文字以下だと登録できない' do
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
      end
      it 'passwordが存在してもpasssword_confirmationが空では登録できない' do
      end
      it 'passwordとpasssword_confirmationが不一致では登録できない' do
      end
      it 'lastnameが空だと登録できない' do
      end
      it 'lastnameが全角（漢字・ひらがな・カタカナ）で入力されていないと登録できない' do
      end
      it 'firstnameが空だと登録できない' do
      end
      it 'firstnameが全角（漢字・ひらがな・カタカナ）で入力されていないと登録できない' do
      end
      it 'last_furiganaが空だと登録できない' do
      end
      it 'last_furiganaが全角（カタカナ）で入力されていないと登録できない' do
      end
      it 'first_furiganaが空だと登録できない' do
      end
      it 'first_furiganaが全角（カタカナ）で入力されていないと登録できない' do
      end
      it 'birthdayが空だと登録できない' do
      end
    end
  end  
end
