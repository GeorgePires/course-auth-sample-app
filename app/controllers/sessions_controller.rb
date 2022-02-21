class SessionsController < ApplicationController
  before_action :authenticate_user!, only: :destroy
  before_action :redirect_if_logged_in, except: :destroy

  def new; end

  def create
    user = User.find_by(email: session_params[:email])
    if user
      session[:user_email] = user.email
      redirect_to root_path
    else
      flash[:error] = 'Invalid email or password'
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path
  end

  private

  def redirect_if_logged_in
    redirect_to root_path if current_user
  end
  
  def session_params
    params.require(:session).permit(:email)
  end
end