require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに@が含まれていれば登録できる' do
        @user.email = 'aaa@aaa'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上入力されていれば登録できる' do
        @user.password = 'test12'
        @user.password_confirmation = 'test12'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが半角英数字混合であれば登録できる' do
        @user.password = 'test123'
        @user.password_confirmation = 'test123'
        expect(@user).to be_valid
      end
      it 'lastnameが全角（漢字・ひらがな・カタカナ）で入力されていれば登録できる' do
        @user.lastname = '山田'
        expect(@user).to be_valid
      end
      it 'firstnameが全角（漢字・ひらがな・カタカナ）で入力されていれば登録できる' do
        @user.lastname = '太郎'
        expect(@user).to be_valid
      end
      it 'last_furiganaが全角（カタカナ）で入力されていれば登録できる' do
        @user.last_furigana = 'ヤマダ'
        expect(@user).to be_valid
      end
      it 'first_furiganaが全角（カタカナ）で入力されていれば登録できる' do
        @user.first_furigana = 'タロウ'
        expect(@user).to be_valid
      end
      it 'birthdayが入力されていれば登録できる' do
        @user.birthday = '2000-01-01'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'emailが重複すると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password should be a mixture of half-width numbers and English')
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password should be a mixture of half-width numbers and English')
      end
      it 'passwordが存在してもpasssword_confirmationが空では登録できない' do
        @user.password = '11111a'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpasssword_confirmationが不一致では登録できない' do
        @user.password = '11111a'
        @user.password_confirmation = '22222a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'lastnameが空だと登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it 'lastnameが全角（漢字・ひらがな・カタカナ）で入力されていないと登録できない' do
        @user.lastname = 'ﾃｽﾄaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname Fill in full-width hiragana, katakana, and kanji')
      end
      it 'firstnameが空だと登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'firstnameが全角（漢字・ひらがな・カタカナ）で入力されていないと登録できない' do
        @user.firstname = 'ﾃｽﾄaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname Fill in full-width hiragana, katakana, and kanji')
      end
      it 'last_furiganaが空だと登録できない' do
        @user.last_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last furigana can't be blank")
      end
      it 'last_furiganaが全角（カタカナ）で入力されていないと登録できない' do
        @user.last_furigana = 'ふりがなてすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last furigana Fill in full-width katakana')
      end
      it 'first_furiganaが空だと登録できない' do
        @user.first_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana can't be blank")
      end
      it 'first_furiganaが全角（カタカナ）で入力されていないと登録できない' do
        @user.first_furigana = 'ふりがなてすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('First furigana Fill in full-width katakana')
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
