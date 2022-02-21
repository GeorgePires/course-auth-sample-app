class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    followed_users = current_user.followed_users.pluck(:id)
    @tweets = Tweet.where(author_id: followed_users << current_user.id).order(created_at: :desc)
    @tweet = Tweet.new
  end

  def create
    if current_user.tweets.create(tweet_params)
      redirect_to tweets_path
    else
      flash[:alert] = "Tweet failed to save."
      render :index
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end