class OrdersController < ApplicationController
  before_action :set_order
  before_action :authenticate_user!
  before_action :sold_out_item
  before_action :move_to_index

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(address_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_order
    @item = Item.find(params[:item_id])
  end

  def address_params
    params.require(:order).permit(:zip_code, :prefecture_id, :city, :address, :building, :tel_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def move_to_index
    redirect_to root_path unless current_user.id != @item.user_id
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out_item
    redirect_to root_path if @item.purchase_record.present?
  end
end
