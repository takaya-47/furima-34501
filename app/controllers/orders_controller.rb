class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user

  def index
    # form_withに渡す、フォームオブジェクトの空のインスタンスを生成
    @ordershipping = OrderShipping.new
  end

  def create
    @ordershipping = OrderShipping.new(ordershipping_params)
    # フォームオブジェクトクラスはActiveRecordを継承していないのでvalid?を実行してバリデーションを実行する必要がある。
    if @ordershipping.valid?
      # 決済処理
      pay_item
      # バリデーションを通過すればフォームオブジェクトで定義したsaveメソッドを実行
      @ordershipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def ordershipping_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id].to_i, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      :amount => @item.price,
      :card => ordershipping_params[:token],
      :currency => 'jpy',
    )
  end

  def ensure_correct_user
    @item = Item.find(params[:item_id])
    # 自身の出品した商品の購入ページへは遷移できない
    redirect_to root_path if current_user.id == @item.user.id
  end

end
