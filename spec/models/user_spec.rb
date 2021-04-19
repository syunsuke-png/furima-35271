require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nickname, email, password, password_confirmation, family_name, first_name, family_name_kana, first_name_kana, barth_dayがが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include 'Family name is invalid'
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name is invalid'
    end
    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include 'Family name kana is invalid'
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana is invalid'
    end
    it 'barth_dayが空では登録できない' do
      @user.barth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Barth day can't be blank"
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = 'aaaa0'
      @user.password_confirmation = 'aaaa0'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'passwordは半角英数字混合の入力でないと登録できない' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'ユーザーの本名は名字がないと登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include 'Family name is invalid'
    end
    it 'ユーザーの本名は名前がないと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it 'family_nameは全角入力でないと登録できない' do
      @user.family_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Family name is invalid'
    end
    it 'first_nameは全角入力でないと登録できない' do
      @user.first_name = 'text'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name is invalid'
    end
    it 'ユーザーのふりがなは名字がないと登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include 'Family name kana is invalid'
    end
    it 'ユーザーのふりがなは名前がないと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana is invalid'
    end
    it 'family_name_kanaはカタカナでないと登録できない' do
      @user.family_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Family name kana is invalid'
    end
    it 'first_name_kanaはカタカナでないと登録できない' do
      @user.first_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana is invalid'
    end
  end
end
