class ProductsController < ApplicationController
before_action :authenticate_user!, only:[:new, :create]
  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    unless current_user.id == @product.user_id
      redirect_to root_path
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private
  def product_params
    params.require(:product).permit(:title, :text, :category_id, :delivery_charge_id, :product_status_id, :area_id, :delivery_day_id, :price, :image ).merge(user_id: current_user.id)
  end
end
