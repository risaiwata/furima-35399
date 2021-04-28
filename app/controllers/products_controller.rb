class ProductsController < ApplicationController
  def index
    @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redeirect_to root_path
    else
      render :new
    end
  end


  private
  def product_params
    params.require(:product).permit(:title, :text, :category_id, :delivery_charge_id, :product_status_id, :area_id, :delivery_day_id, :price, :image ).merge(user_id: current_user.id)
  end
end
