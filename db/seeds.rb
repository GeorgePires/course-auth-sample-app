require 'faker'

users = []
50.times do
  user = User.create(email: Faker::Internet.unique.email)
  rand(0..25).times do
    content = [Faker::Hipster.paragraph, Faker::Hacker.say_something_smart, Faker::ChuckNorris.fact, Faker::Lorem.sentence(word_count: rand(10..100))].sample
    Tweet.create(author: user, body: content)
  end
  users << user
end

users.each do |user|
  rand(0..10).times do
    followed_user = users.sample
    while (user.followed_users.include? followed_user)
      followed_user = users.sample
    end
    user.follow(users.sample)
  end
end
