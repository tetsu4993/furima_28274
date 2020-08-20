FactoryBot.define do
  factory :user do
    family_name            {"安倍"}
    family_name_kana       {"アベ"}
    first_name             {"たかし"}
    first_name_kana        {"タカシ"}
    nickname               {Faker::Name.initials(number: 2)}
    birthday               {Faker::Date.birthday(min_age: 18, max_age: 65)}
    email                  {Faker::Internet.email}
    password               {Faker::Internet.password(min_length: 6) + "1a"}
    password_confirmation  {password}
  end
end
