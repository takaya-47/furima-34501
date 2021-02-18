require 'rails_helper'

RSpec.describe User, type: :model do

before do
  @user = FactoryBot.build(:user)
end

describe "ユーザー新規登録" do
  context "ユーザー登録成功" do
    it "すべての項目が正しく入力されていれば登録できる" do
      expect(@user).to be_valid
    end
  end

  context "ユーザー登録失敗" do
    it "nicknameが空では登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "passwordが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordは6文字以上でなければ登録できない" do
      password = "pass1"
      @user.password = password
      @user.password_confirmation = password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "passwordは確認用と一致していないと登録できない" do
      @user.password = "pass12"
      @user.password_confirmation = "word34"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordは半角英数のみでなければ登録できない" do
      password = "パス_word"
      @user.password = password
      @user.password_confirmation = password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数字で入力してください")
    end

    it "last_nameが空では登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.last_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は全角（漢字・ひらがな・カタカナ）で入力してください")
    end

    it "first_nameが空では登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角（漢字・ひらがな・カタカナ）で入力してください")
    end

    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "last_name_kanaは全角カタカナでなければ登録できない" do
      @user.last_name_kana = "やまだ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana は全角カタカナで入力してください")
    end

    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "first_name_kanaは全角カタカナでなければ登録できない" do
      @user.first_name_kana = "たろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力してください")
    end
  end
end

end
