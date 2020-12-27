class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :new, :update, :destroy]
  def index
    # 商品出品機能の実装のためコメントアウト1226 @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id,
    :price, :prefecture_id, :shipping_date_id,:shipping_charge_id,:image).merge(user_id: current_user.id)
  end
end

