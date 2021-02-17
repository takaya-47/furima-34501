# テーブル設計


## users テーブル

| Column             | Type   | Options                   |
 | ------------------ | -------| -------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| explain         | text       | null: false                    |
| price           | integer    | null: false                    |
| category_id     | integer    | null: false, foreign_key: true |
| item_status_id  | integer    | null: false, foreign_key: true |
| shipping_fee_id | integer    | null: false, foreign_key: true |
| prefecture_id   | integer    | null: false, foreign_key: true |
| delivery_id     | integer    | null: false, foreign_key: true |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order
- has_one    :category
- has_one    :item_status
- has_one    :shipping_fee
- has_one    :prefecture
- has_one    :delivery


## orders テーブル

| Column      | Type       | Options                        |
| ------------| ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |
| shipping_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :shipping


## shippings テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| city            | string     | null: false                    |
| address         | string     | null: false                    |
| building        | string     | null: false                    |
| phone_number    | string     | null: false                    |
| prefecture_id   | references | null: false, foreign_key: true |

### Association

- has_one :order
- has_one :prefecture