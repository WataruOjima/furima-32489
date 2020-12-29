class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :new, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, except: [:index, :show]
  def index
    @items = Item.order('created_at DESC')
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

  def show
    # @item = Item.find(params[:id])
  end

  def edit
    # @item = Item.find(params[:id])
  end

  def update
    # @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id,
                                 :price, :prefecture_id, :shipping_date_id, :shipping_charge_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end
  end
end
