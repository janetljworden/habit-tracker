class ApplicationController < ActionController::Base
  
  private

  def ensure_logged_in
    if !current_user
      redirect_to root_path, alert: "Invalid Request"
    end
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end
