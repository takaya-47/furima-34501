class ItemsController < ApplicationController
  # ログインが必要なアクション
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  # 編集は自身が出品した商品しか行えないため、アクセス制限をかける
  before_action :ensure_correct_user, only: [:edit, :update]

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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :price, :category_id, :item_status_id, :shipping_fee_id,
                                 :prefecture_id, :delivery_id).merge(user_id: current_user.id)
  end

  def ensure_correct_user
    # URLから変数itemのidを取得する
    @item = Item.find(params[:id])
    # ログイン中のユーザーのidと、遷移しようとしている商品ページの商品を出品したユーザーのidが一致しなければトップページへ強制的に遷移させる。
    redirect_to root_path if current_user.id != @item.user.id
  end
end
