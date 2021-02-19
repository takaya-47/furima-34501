FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    explain{ Faker::Lorem.sentence(word_count: 3) }
    price { 1000 }
    category_id { 1 }
    item_status_id { 1 }
    shipping_fee_id { 1 }
    prefecture_id { 1 }
    delivery_id { 1 }

    # インスタンスに紐づくユーザーも生成
    association :user

    # インスタンス生成後に画像を生成
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end

  end
end
