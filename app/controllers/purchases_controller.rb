class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @purchase_information = PurchaseInformation.new
  end

  def create
    @purchase_information = PurchaseInformation.new(purchase_params)
    if @purchase_information.valid?
      @purchase_information.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

    def purchase_params
      params.require(:purchase_information).permit( :postalcode, :area_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id)
    end

end
