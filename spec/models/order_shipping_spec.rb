require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    # 自分で関連付けを定義するためにuserインスタンスとitemインスタンスを生成
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    # 関連付けを定義しながら@order_shippingを生成
    @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '商品の購入ができる時' do
      it '正しい情報を入力すれば商品を購入できる' do
        expect(@order_shipping).to be_valid
      end

      it 'phone_numberは半角数字10桁でも登録できる' do
        @order_shipping.phone_number = '0123456789'
        expect(@order_shipping).to be_valid
      end

      it 'buildingは空でも購入できる' do
        @order_shipping.building = nil
        expect(@order_shipping).to be_valid
      end
    end

    context '商品の購入ができない時' do
      it 'postal_codeがなければ購入できない' do
        @order_shipping.postal_code = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeはハイフンが必要' do
        @order_shipping.postal_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postal code is invalid')
      end

      it 'prefecture_idを選択しなければ購入できない' do
        @order_shipping.prefecture_id = 0
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Prefecture Select')
      end

      it 'cityがなければ購入できない' do
        @order_shipping.city = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end

      it 'addressがなければ購入できない' do
        @order_shipping.address = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberがなければ購入できない' do
        @order_shipping.phone_number = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'tokenがなければ購入できない' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idがなければ購入できない' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idがなければ購入できない' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
