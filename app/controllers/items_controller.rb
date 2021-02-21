class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order(created_at: 'DESC').includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # ルーティングに含まれるid情報を使って表示するitemを特定する
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :price, :category_id, :item_status_id, :shipping_fee_id,
                                 :prefecture_id, :delivery_id).merge(user_id: current_user.id)
  end
end
