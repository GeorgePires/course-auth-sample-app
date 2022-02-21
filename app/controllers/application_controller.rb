class ApplicationController < ActionController::Base
  helper_method :current_user, :authenticate_user!

  def current_user
    @current_user ||= User.find_by_email(session[:user_email]) if session[:user_email]
  end

  def authenticate_user!
    unless current_user
      redirect_to new_session_path, alert: "Please sign in."
    end
  end
end
