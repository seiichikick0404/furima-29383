FactoryBot.define do
  factory :item do
    name                  {"メルカリです"}
    text                  {"良い商品です"}
    category_id           {'2'}
    status_id             {'2'}
    burden_id             {'2'}
    shipping_origin_id    {'2'}
    shipping_day_id       {'2'}
    price                 {'3000'}
    association :user
  end
end