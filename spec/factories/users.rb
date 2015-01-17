FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    provider 'provider'
    uid 'uid'
  end
end
