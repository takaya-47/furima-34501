class Shipping < ApplicationRecord
  belongs_to :order

  # ActiveHashクラスとのアソシエーション定義のためにmoduleを取り込む
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
