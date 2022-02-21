class FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @followers = current_user.followers
  end

  def create
    @user = User.find(params[:followed_user_id])
    current_user.follow(@user)
    redirect_to @user
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_to user_path(id: params[:id])
  end
end