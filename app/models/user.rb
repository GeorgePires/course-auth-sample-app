# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :tweets, foreign_key: :author_id
  # followers is a collection of users who follow this user
  has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"
  has_many :followers, through: :received_follows, source: :follower

  # followed_users is a collection of users who this user follows
  has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"
  has_many :followed_users, through: :given_follows, source: :followed_user

  def follow(followed_user)
    given_follows.create(followed_user: followed_user, follower: self)
  end

  def unfollow(followed_user_id)
    given_follows.find_by(followed_user_id: followed_user_id, follower: self).delete
  end
end
