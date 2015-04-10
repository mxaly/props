FactoryGirl.define do
  factory :prop do
    body FFaker::Lorem.paragraph
    association :propser, factory: :user
    after :build do |prop|
      prop.prop_receivers.new(user_id: Random.rand(1000))
    end
  end
end
