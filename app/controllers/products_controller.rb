class ProductsController < ApplicationController
before_action :authenticate_user!, only:[:new, :create, :edit, :update]
before_action :set_product, only:[:show, :edit, :update]
before_action :set_user_validate, only:[:edit, :update]

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
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end


  private
  def product_params
    params.require(:product).permit(:title, :text, :category_id, :delivery_charge_id, :product_status_id, :area_id, :delivery_day_id, :price, :image ).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_user_validate
    @product.user_id == current_user.id
  end
end
