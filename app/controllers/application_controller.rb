class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_user!
    unless current_user
      redirect_to new_session_path, flash: {error: "Please log in first"}
    end
  end

  def skip_if_logged_in
    if current_user
      redirect_to messages_path
    end 
  end
end
