class FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    @follows = current_user.received_follows.includes(:follower).where.not(status: 'rejected')
  end

  def create
    @user = User.find(params[:followed_user_id])
    if @user.private 
      current_user.request_follow(@user)
    else
      current_user.follow(@user)
    end
    redirect_to @user
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_to user_path(id: params[:id])
  end

  def update
    follow = Follow.find(params[:id])
    follow.update(follow_params)
    redirect_to follows_path
  end

  private

  def follow_params
    params.require(:follow).permit(:status)
  end
end