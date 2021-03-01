class ItemsController < ApplicationController
  # ログインが必要なアクション
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # 商品を特定するためのメソッド
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  # 編集や削除は自身が出品した商品で、かつまだ売れていない商品のみ行える。
  before_action :ensure_correct_access, only: [:edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    @items = Item.search(params[:keyword]).page(params[:page]).per(3)
  end

  private

  def item_params
    params.require(:item).permit(:name, :explain, :price, :category_id, :item_status_id, :shipping_fee_id, :prefecture_id, :delivery_id, images: []).merge(user_id: current_user.id)
  end

  def find_item
    # ルーティングから商品のidを特定
    @item = Item.find(params[:id])
  end

  def ensure_correct_access
    redirect_to root_path if current_user.id != @item.user.id || @item.order.present?
  end
end
