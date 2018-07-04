FactoryBot.define do
  factory :event do
    name { Faker::Book.title }
    description { Faker::Dune.quote }
    start_time '2018-07-30 11:01:54'
  end
end
