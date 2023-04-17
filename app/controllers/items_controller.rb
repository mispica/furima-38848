class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  private
  
  def item_params
    params.reqire(:item).permit(:item_name, :content, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)

end
