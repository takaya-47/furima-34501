class ShipppingFee < ActiveHash::Base
  self.data = [
    {id: 1, name: "---"},
    {id: 1, name: "着払い(購入者負担)"},
    {id: 1, name: "送料込み(出品者負担)"}
  ]

  # Itemクラスとのアソシエーション定義のためにmoduleを取り込む
  include ActiveHash::Associations
  has_many :items
end