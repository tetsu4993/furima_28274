FactoryBot.define do

  factory :user do

    family_name            {"阿部"}
    family_name_kana       {"アベ"}
    first_name             {"たかし"}
    first_name_kana        {"タカシ"}
    nickname               {"abe"}
    birthday               {Date.today}
    email                  {"kkk@email.com"}
    password               {"a0a0a0"}
    password_confirmation  {"a0a0a0"}
  end
end
