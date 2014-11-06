require 'ffaker'

puts '== Creating users'
20.times do
  User.create!(name: Faker::Name.name,
               email: Faker::Internet.email)
end

puts '== Creating props'
user_ids = User.pluck(:id)
100.times do
  user_id = user_ids.sample
  propser_id = (user_ids - [user_id]).sample
  body = if [true, false].sample
           Faker::HipsterIpsum.sentence
         else
           Faker::HipsterIpsum.paragraph[0..250]
         end
  date = Random.rand(60.days.to_i).seconds.ago
  Prop.create!(user_id: user_id,
               propser_id: propser_id,
               body: body,
               created_at: date,
               updated_at: date)
end

puts '== Creating upvotes'
prop_ids = Prop.pluck(:id)
100.times do
  user_id = user_ids.sample
  prop_id = prop_ids.sample
  Upvote.create(prop_id: prop_id, user_id: user_id)
end
puts '== DONE!'
