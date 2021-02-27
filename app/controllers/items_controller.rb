class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]

  def index
    @items = Item.all
  end
 
  def new
    @item = Item.new(params[:id])
  end

  def create
    
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :description, :price, :category_id, :status_id, :shipping_id, :area_id, :estimate_id, :image).merge(user_id: current_user.id)
  end
end
