FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username }
    email                 {Faker::Internet.free_email}
    password              {"aaa111111"}
    password_confirmation {password}
    fam_name              {"安倍"}
    fir_name              {"隆"}
    fam_kana_name         {"アベ"}
    fir_kana_name         {"タカシ"}
    birthday { Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today) }
  end
end