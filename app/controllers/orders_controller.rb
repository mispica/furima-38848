class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :order_set_item

  def index
    if (current_user.id == @item.user_id) || @item.order
      redirect_to root_path
    end
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipality, :house_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price, 
    card: order_params[:token], 
    currency: 'jpy'    
    )
  end

  private

  def order_set_item
    @item = Item.find(params[:item_id])
  end

end
