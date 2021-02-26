class ItemsController < ApplicationController

  def index

  end
 
  def new
    @item = Item.new
  end

  def create
  
  end
  private
  def item_params
    params.require(:item).permit(:product_name, :description, :price, :category_id, :status_id, :shipping_id, :area_id, :estimate_id, :user_id, :image)
  end
end
