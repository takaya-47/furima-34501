FactoryBot.define do
  factory :shipping do
    postal_code { 'MyString' }
    city { 'MyString' }
    address { 'MyString' }
    building { 'MyString' }
    phone_number { 'MyString' }
    prefecture_id { 1 }
    order { nil }
  end
end
