FactoryBot.define do
  factory :purchase_address do
    number { '4242424242424242' }
    exp_month { '3' }
    exp_year { '23' }
    cvc { '123' }
    postal { '123-9987' }
    genre_id {'2'}
    city { "江東区" }
    house_num { '1-1' }
    building { '東京ハイツ' }
    phone { '09098765432' }
    association :user
    association :item
  end
end