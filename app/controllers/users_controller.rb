class UsersController < ApplicationController
  before_action :ensure_logged_in, except:  [:new, :create]
  before_action :load_user, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to root_path, notice: "Account Created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end
  
  def edit
  end

  def update
    if @user.authenticate(user_params[:old_password])
      if @user.update(user_params.except(:old_password))
        redirect_to @user, notice: "Account Updated."
      else
        render :edit, status: :unprocessable_entity
      end
    else
      flash.now[:alert] = "Please provide your current password to update your account."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to login_path, alert: "Account Deleted."
  end

  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:old_password)
  end

  def load_user
    @user = User.find params[:id]
  end
end