require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context "商品の出品ができる時" do
      it "すべての情報が適切に入力されていれば商品の出品ができる" do
        expect(@item).to be_valid
      end
    end

    context "商品の出品ができない時" do
      it "imageがなければ出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameがなければ出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "explainがなければ出品できない" do
        @item.explain = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end

      it "priceがなければ出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceは半角数字でなければ出品できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "priceは300未満だと出品できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "priceは10000000以上だと出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it "category_idは0以外でなければ出品できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it "item_status_idは0以外でなければ出品できない" do
        @item.item_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status Select")
      end

      it "shipping_fee_idは0以外でなければ出品できない" do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee Select")
      end

      it "prefecture_idは0以外でなければ出品できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end

      it "delivery_idは0以外でなければ出品できない" do
        @item.delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery Select")
      end

    end
  end

end
