FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"aaa111111"}
    password_confirmation {password}
    fam_name              {"安倍"}
    fir_name              {"隆"}
    fam_kana_name         {"アベ"}
    fir_kana_name         {"タカシ"}
    birthday              {'1990-01-01'}
  end
end