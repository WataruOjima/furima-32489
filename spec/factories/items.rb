FactoryBot.define do
  factory :item do
    item_name          { '商品名' }
    description        { '説明' }
    category_id        { 1 }
    condition_id       { 1 }
    price              { 300 }
    prefecture_id      { 1 }
    shipping_date_id   { 1 }
    shipping_charge_id { 1 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
