class OrdersController < ApplicationController

  def index
    # ルーティングのparamsから商品のidを取得している
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      Shipping.create(shipping_params)
      redirect_to root_path
    else
      render :index
    end
  end

  private
    def order_params
      params.permit(:item_id).merge(user_id: current_user.id)
    end

    def shipping_params
      params.permit(:postal_code, :city, :address, :building, :phone_number, :prefecture_id).merge(order_id: @order.id)
    end

end
