class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(user_params[:email])
    if user
      flash[:alert] = "Email already exists."
      render :new
    elsif user = User.create(user_params)
      session[:user_email] = user.email
      redirect_to root_path, notice: "User created successfully."
    else
      flash[:alert] = "User failed to save."
      render :new
    end
  end

  def show
    @is_current_user = current_user.id == params[:id].to_i
    @user = @is_current_user ? current_user : User.find(params[:id])
    @tweets = @user.tweets.order(created_at: :desc)
    @following = @is_current_user ? false : current_user.followed_users.exists?(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end