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
    # birthday              {'1990-01-01'}
    birthday { Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today) }
  end
end

# FactoryBot.define do
#   factory :user do
#     nickname { Faker::Internet.username }
#     password { '1a' + Faker::Internet.password(min_length: 7, max_length: 20) }
#     # password              {"aaa111111"}
#     password_confirmation {password}
#     email { Faker::Internet.email }
#     # 誕生日は一意性ではないよ
#     birthday { Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today) }
#     fam_name { '田中' }
#     fir_name { '太郎' }
#     fam_kana_name { 'タナカ' }
#     fir_kana_name { 'タロウ' }
#   end
# end
