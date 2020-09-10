FactoryBot.define do
  factory :purchase_address do
    token  {"aaa111zzz3"}
    postal { '123-9987' }
    genre_id {'2'}
    city { "江東区" }
    house_num { '1-1' }
    phone { '09098765432' }
  end
end