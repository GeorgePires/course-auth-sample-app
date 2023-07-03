# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  body       :string
#  author_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tweet < ApplicationRecord
  belongs_to :author, class_name: "User"
end
