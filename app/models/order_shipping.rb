# フォームオブジェクトクラスを定義する
class OrderShipping
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :order_id

  with_options presence: true do
    validates :postal_code , format: { with: /\A[0-9]{3}[-][0-9]{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/}
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :order_id
  end

end