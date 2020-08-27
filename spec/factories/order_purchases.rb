FactoryBot.define do
  factory :order_purchase do

    prefecture_id            {Faker::Number.within(range: 2..48)}
    postcode                 {"123-4567"}
    city                     {"大阪市"}
    block                    {"北区"}
    building                 {Faker::Lorem.word}
    phonenumber              {"09012345678"}
    # created_at               {Faker::Date.between(from: '2014-09-23', to: '2020-8-20')}
    # updated_at               {created_at}
     token                    {"whook_3cac81b60d38911bdf8d846799"}
  end
end
