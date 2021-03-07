class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @purchase_information = PurchaseInformation.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_information = PurchaseInformation.new(purchase_params)
    if @purchase_information.valid?
      pay_item
      @purchase_information.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def move_to_index
    item = Item.find(params[:item_id])
    if (current_user.id == item.user_id) || item.purchase.present?
      redirect_to root_path
    end
  end

  def purchase_params
    params.require(:purchase_information).permit( :postalcode, :area_id, :municipality, :address, :building_name, :phone_number, :item_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],    
      currency: 'jpy'                 
    )
  end
end
