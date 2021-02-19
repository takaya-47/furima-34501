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
    validates :image
    validates :name
    validates :explain
    validates :price, format: { with: /\A[0-9]+\z/, message: "Half-width number" },
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }
    with_options numericality: { other_than: 0, message: "Select" } do
      validates :category_id
      validates :item_status_id
      validates :shipping_fee_id
      validates :prefecture_id
      validates :delivery_id
    end
  end

end
