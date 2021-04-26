class UsersController < ApplicationController
  def create
    @user = User.new(params[:user][:birthdate])
    @user.save
  end

  private
def user_params
  params.require(:user).permit(:birthdate)
end

end
