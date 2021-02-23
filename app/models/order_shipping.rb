# フォームオブジェクトクラスを定義する
class OrderShipping
  include ActiveModel::Model

  # ordersテーブルとshippingsテーブルに保存したいカラムを全て記述
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :postal_code , format: { with: /\A[0-9]{3}[-][0-9]{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/}
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    # フォームオブジェクトクラスではアソシエーションを定義できないため、Shippingモデルのbelongs_toと同じバリデーションが必要
    validates :order_id
  end

  # フォームオブジェクトクラスはActiveRecordを継承していないのでsaveメソッドを自分で記述する必要がある。
  def save
    order = Order.create(item_id: params[:item_id].to_i, user_id: current_user.id)
    # 先に変数orderを作成しておくのがキモ
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end

end