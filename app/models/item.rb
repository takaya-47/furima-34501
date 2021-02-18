class Item < ApplicationRecord
  belongs_to :user

  # ActiveHashクラスとのアソシエーション定義のためにmoduleを取り込む
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :delivery

end
