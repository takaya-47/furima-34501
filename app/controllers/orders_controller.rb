class OrdersController < ApplicationController
  def index
    # ルーティングのparamsから商品のidを取得している
    @item = Item.find(params[:item_id])
  end
end
