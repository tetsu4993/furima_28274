FactoryBot.define do
  factory :purchase do
    association :order
    prefecture_id            {Faker::Number.within(range: 2..48)}
    postcode                 {"123-4567"}
    city                     {Faker::Lorem.word}
    block                    {Faker::Lorem.word}
    building                 {Faker::Lorem.word}
    phonenumber              {"09012345678"}
    created_at               {Faker::Date.between(from: '2014-09-23', to: '2020-8-20')}
    updated_at               {created_at}
  end
end
