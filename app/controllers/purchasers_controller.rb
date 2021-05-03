class PurchasersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @purchaser_address = PurchaserAddress.new
  end
  
  def create
    @product = Product.find(params[:product_id])
    @purchaser_address = PurchaserAddress.new(purchaser_params)
    if @purchaser_address.valid?
      pay_item
      @purchaser_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchaser_params
    params.require(:purchaser_address).permit(:postal_code_id, :area_id, :city, :address_line, :building, :phonenumber).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    
      Payjp::Charge.create(
        amount: @product.price,  # 商品の値段
        card: purchaser_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
