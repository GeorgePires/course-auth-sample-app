class ApplicationController < ActionController::Base
  include Pundit::Authorization
  
  helper_method :current_user, :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    @current_user ||= User.find_by_email(session[:user_email]) if session[:user_email]
  end

  def authenticate_user!
    unless current_user
      redirect_to new_session_path, alert: "Please sign in."
    end
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to root_path
  end
end
