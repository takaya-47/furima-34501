require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録成功' do
      it 'すべての項目が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録失敗' do
      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it '重複したemailは登録できない' do
        @user.save
        @other_user = FactoryBot.build(:user)
        @other_user.email = @user.email
        @other_user.valid?
        expect(@other_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordは6文字以上でなければ登録できない' do
        password = 'pass1'
        @user.password = password
        @user.password_confirmation = password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordは確認用と一致していないと登録できない' do
        @user.password = 'pass12'
        @user.password_confirmation = 'word34'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'passwordは半角英語だけでは登録できない' do
        password = 'password'
        @user.password = password
        @user.password_confirmation = password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字を含めて入力してください')
      end

      it 'passwordは半角数字だけでは登録できない' do
        password = '123456'
        @user.password = password
        @user.password_confirmation = password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字を含めて入力してください')
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end

      it 'last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字は全角（漢字・ひらがな・カタカナ）で入力してください')
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end

      it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は全角（漢字・ひらがな・カタカナ）で入力してください')
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("フリガナ（名字）を入力してください")
      end

      it 'last_name_kanaは全角カタカナでなければ登録できない' do
        @user.last_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('フリガナ（名字）は全角カタカナで入力してください')
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("フリガナ（名前）を入力してください")
      end

      it 'first_name_kanaは全角カタカナでなければ登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('フリガナ（名前）は全角カタカナで入力してください')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
    end
  end
end
