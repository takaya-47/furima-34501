FactoryBot.define do
  factory :item do
    name { "MyString" }
    explain { "MyText" }
    price { 1 }
    user { nil }
  end
end
