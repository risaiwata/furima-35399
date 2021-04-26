class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configre_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
      #username == 'admin' && password == '3737'
    end
  end

  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_ruby, :last_name_ruby, :birthdate])
    #devise_parameter_sanitizer.permit(:sign_in, keys: [:email,:password])
  end
end

