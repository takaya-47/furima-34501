FactoryBot.define do
  factory :user do
    # gem gimeiを使って日本語のユーザー名を作成
    gimei = Gimei.name

    nickname {gimei.kanji}
    email {Faker::Internet.email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name {gimei.last.kanji}
    first_name {gimei.first.kanji}
    last_name_kana {gimei.last.katakana}
    first_name_kana {gimei.first.katakana}
    birthday {Faker::Date.in_date_period(year: 2000, month: 1)}
  end

end
