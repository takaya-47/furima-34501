class Item < ApplicationRecord
  # モデルとのアソシエーション
  belongs_to :user
  # 画像を１枚添付できる
  has_one_attached :image

  # ActiveHashクラスとのアソシエーション定義のためにmoduleを取り込む
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery

  with_options presence: true do
    validates :name
    validates :explain
    validates :price
  end
  with_options numericality: { other_than: 0 } do
    # numericalityはpresence: trueの意味も含む
    :category_id
    :item_status_id
    :shipping_fee_id
    :prefecture_id
    :delivery_id
  end
end
