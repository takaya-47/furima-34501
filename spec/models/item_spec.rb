require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品ができる時' do
      it 'すべての情報が適切に入力されていれば商品の出品ができる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない時' do
      it 'imageがなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("出品画像を入力してください")
      end

      it 'nameがなければ出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it 'explainがなければ出品できない' do
        @item.explain = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'priceがなければ出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end

      it 'priceは半角数字でなければ出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300円から10,000,000円未満です')
      end

      it 'priceが半角英数字混合では出品できない' do
        @item.price = '1000yen'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300円から10,000,000円未満です')
      end

      it 'priceが半角英字のみでは出品できない' do
        @item.price = 'price'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300円から10,000,000円未満です')
      end

      it 'priceは300未満だと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300円から10,000,000円未満です')
      end

      it 'priceは10000000以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300円から10,000,000円未満です')
      end

      it 'category_idは0以外でなければ出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end

      it 'item_status_idは0以外でなければ出品できない' do
        @item.item_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end

      it 'shipping_fee_idは0以外でなければ出品できない' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end

      it 'prefecture_idは0以外でなければ出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end

      it 'delivery_idは0以外でなければ出品できない' do
        @item.delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end
    end
  end
end
