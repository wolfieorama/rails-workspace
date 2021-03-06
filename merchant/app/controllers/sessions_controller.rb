class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by_auth(request.env["omniauth.auth"])
      session[:user_id] = @user
    redirect_to products_path, notice: "logged in as "
  end

  def destroy
    session[:user_id] = nil
    session[:order_id] = nil
    redirect_to root_path, notice: "Goodbye!!"
  end

end
