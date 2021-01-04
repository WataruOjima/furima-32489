class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]
  before_action :move_to_index, only: [:create,:index]
  def index 
    @item = Item.find(params[:item_id])
    @order = Order.new
    # if current_user == @item.user || @item.present?
    #    redirect_to root_path
    # end
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(address_params)
    if @order.valid?
       @order.save
       pay_item
       redirect_to root_path
    else
      render action: :index
    end
  end

  private 
  
  def address_params
    params.require(:order).permit(:zip_code, :prefecture_id, :city, :address, :building, :tel_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path unless current_user.id != @item.user_id
  end

  # def pay_item
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   Payjp::Charge.create(
  #     amount: @item.price,
  #     card: address_params[:token],
  #     currency:'jpy'
  #   )
  # end

end
