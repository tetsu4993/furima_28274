FactoryBot.define do

  factory :user do

    family_name            {"阿部"}
    family_name_kana       {"アベ"}
    first_name             {"たかし"}
    first_name_kana        {"タカシ"}
    nickname               {"abe"}
    birthday               {2019}
    email                  {"kkk@email.com"}
    password               {"0000000"}
    password_confirmation  {"0000000"}
  end
end
