FactoryBot.define do
  factory :user do
    name                  {"test"}
    email                 {"test@co.jp"}
    password              {"abc123"}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    katakana_last_name    {"ヤマダ"}
    katakana_first_name   {"タロウ"}
    birthday              {"1999-10-10"}
  end
end