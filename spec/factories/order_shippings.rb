FactoryBot.define do
  factory :order_shipping do
    postal_code { '123-4567'}
    city { '長野市' }
    address { '1-1' }
    building { '長野ビル' }
    phone_number { '09012345678' }
    prefecture_id { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

# フォームオブジェクトクラスはモデルではないので、FactroyBotで関連するモデルのインスタンスを生成できない。テストファイルで手動で生成する必要がある。