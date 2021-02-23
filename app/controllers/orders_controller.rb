class OrdersController < ApplicationController

  def index
    # ルーティングのparamsから商品のidを取得している
    @item = Item.find(params[:item_id])
    # form_withに渡す、フォームオブジェクトの空のインスタンスを生成
    @ordershipping = OrderShipping.new
  end

  def create
    @ordershipping = OrderShipping.new(ordershipping_params)
    # フォームオブジェクトクラスはActiveRecordを継承していないのでvalid?を実行してバリデーションを実行する必要がある。
    if @ordershipping.valid?
      # バリデーションを通過すればフォームオブジェクトで定義したsaveメソッドを実行
      @ordershipping.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
    def ordershipping_params
      params.require(:order_shipping).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id].to_i, token: params[:token])
    end

end
