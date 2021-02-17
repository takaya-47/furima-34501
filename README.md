# テーブル設計


## users テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| nickname       | string     | null: false                    |
| email          | string     | null: false                    |
| password       | string     | null: false                    |
| last_name      | string     | null: false                    |
| last_name      | string     | null: false                    |
| first_name     | string     | null: false                    |
| birth_year_id  | references | null: false, foreign_key: true |
| birth_month_id | references | null: false, foreign_key: true |
| birth_date_id  | references | null: false, foreign_key: true |

### Association

- has_many :items
- has_many :purchases
- has_one  :birthYear
- has_one  :birthMonth
- has_one  :birthDate


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| explain         | text       | null: false                    |
| price           | integer    | null: false                    |
| purchased       | boolean    | null: false                    |
| user_id         | references | null: false, foreign_key: true |
| purchase_id     | references | null: false, foreign_key: true |
| category_id     | references | null: false, foreign_key: true |
| item_status_id  | references | null: false, foreign_key: true |
| shipping_fee_id | references | null: false, foreign_key: true |
| prefecture_id   | references | null: false, foreign_key: true |
| delivery_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase
- has_one    :category
- has_one    :item_status
- has_one    :shipping_fee
- has_one    :prefecture
- has_one    :delivery


## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     | null: false                    |
| phone_number    | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |
| prefecture_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :prefecture