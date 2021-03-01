class Item < ApplicationRecord
  # モデルとのアソシエーション
  belongs_to :user
  has_one :order
  # 画像を複数枚添付できる
  has_many_attached :images

  # ActiveHashクラスとのアソシエーション定義のためにmoduleを取り込む
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery

  with_options presence: true do
    validates :images
    validates :name
    validates :explain
    validates :price, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' },
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300円から10,000,000円未満です' }
    with_options numericality: { other_than: 0, message: 'を選択してください' } do
      validates :category_id
      validates :item_status_id
      validates :shipping_fee_id
      validates :prefecture_id
      validates :delivery_id
    end
  end

  def self.search(keyword)
    if keyword != ''
      Item.where('name LIKE(?)', "%#{keyword}%").desc_order
    else
      desc_order
    end
  end

  def self.desc_order
    # 商品は常に最新のものが先頭に来るよう表示する
    Item.order(created_at: 'DESC').includes(:user)
  end
end
