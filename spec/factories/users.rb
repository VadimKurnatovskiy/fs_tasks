FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.free_email }
    password '111111'
    password_confirmation '111111'
  end
end
