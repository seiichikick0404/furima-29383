FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk111@gmail.com"}
    password              {"000aaa111"}
    password_confirmation {password}
    
  end
end