class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :new, :update, :destroy]
  def index
    @items = Item.all
  end

  def new
  end

  def create
  end 

  private
  def message_params
    params.require(:item).permit(:item_name, :user_id, :description, :category_id, :condition_id,
    :price, :prefecture_id, :shipping_date_id,:shipping_charge_id,:image).merge(user_id: current_user.id)
  end
end
