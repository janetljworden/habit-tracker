class UsersController < ApplicationController
  before_action :authenticate, except:  [:new, :create, :show]
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
  
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def load_user
    @user = User.find params[:id]
  end
end