class UserPolicy < ApplicationPolicy
  def update?
    user.id == record.id
  end

  def show_tweets?
    return true unless record.private
    return true if user.id == record.id
    record.received_follows.where(status: "accepted", follower_id: user.id).any?
  end
end
