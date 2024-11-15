class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.authenticate(params[:password])
      login(@user)
      redirect_to habits_path, notice: "Logged in"
    else 
      redirect_to login_path, alert: "Invalid Email or Password"
    end
  end

  def destroy
    logout
    redirect_to login_path, notice: "Logged out."
  end
end
