class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :set_user, only: [:show, :edit, :update]

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
    @is_current_user = current_user.id == @user.id
    @tweets = @user.tweets.order(created_at: :desc)
    @follow_status = follow_status unless @is_current_user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to @user, notice: "User updated successfully."
    else
      flash[:alert] = "User failed to update."
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :private)
  end

  def follow_status
    follows = current_user.given_follows.where(followed_user: @user)
    return "none" if follows.empty? || follows.all? { |f| f.status == "rejected" }
    return "accepted" if follows.where(status: "accepted").any?
    return "pending" if follows.where(status: "pending").any?
  end
end
