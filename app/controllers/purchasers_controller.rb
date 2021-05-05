class PurchasersController < ApplicationController

  before_action :set_product, only:[:index, :create]
  before_action :authenticate_user!, only:[:index, :create]

  def index
    @purchaser_address = PurchaserAddress.new
    if current_user.id == @product.user.id || @product.purchaser.nil? 
      redirect_to root_path
    end
  end
  
  def create
    @purchaser_address = PurchaserAddress.new(purchaser_params)
    if @purchaser_address.valid?
      pay_item
      @purchaser_address.save
      redirect_to root_path
    else
      render :index
    end
    if current_user.id == @product.user.id || @product.purchaser.nil? 
      redirect_to root_path
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

  def set_product
    @product = Product.find(params[:product_id])
  end

end
