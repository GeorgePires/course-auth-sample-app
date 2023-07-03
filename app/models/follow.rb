# == Schema Information
#
# Table name: follows
#
#  id               :bigint           not null, primary key
#  followed_user_id :bigint           not null
#  follower_id      :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Follow < ApplicationRecord
  belongs_to :followed_user, class_name: 'User'
  belongs_to :follower, class_name: 'User'
end
