class PurchasersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
  end
  
  def create
    @product = Product.find(params[:product_id])
    @purchaser_address = PurchaserAddress.new(purchaser_params)
    if @purchaser_address.valid?
      @purchaser_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchaser_params
    params.require(:purchaser_address).permit(:postal_code_id, :area_id, :city, :address_line, :building, :phonenumber).merge(user_id: current_user.id, product_id: product.id)
  end
end
