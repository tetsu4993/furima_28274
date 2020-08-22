FactoryBot.define do
  factory :item do
    #item_id                  {Faker::Number.within(range: 1..1000000000000)}
    title                    {Faker::Lorem.word}
    text                     {Faker::Lorem.word}
    price                    {Faker::Number.within(range: 300..9999999)}
    category_id              {Faker::Number.within(range: 2..11)}
    condition_id             {Faker::Number.within(range: 2..7)}
    area_burden_id           {Faker::Number.within(range: 2..48)}
    fee_burden_id            {Faker::Number.within(range: 2..3)}
    handing_time_id          {Faker::Number.within(range: 2..4)}
    association :user
    created_at               {Faker::Date.between(from: '2014-09-23', to: '2020-8-20')}
    updated_at               {created_at}
  end
end
