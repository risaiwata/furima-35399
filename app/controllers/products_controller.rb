class ItemsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  private
  def message_params
    params.require(:product).permit(:content, :image).merge(user_id: current_user.id)
  end
end
