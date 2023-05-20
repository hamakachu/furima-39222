# README

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique :true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_kana        | string | null: false               |
| first_kana         | string | null: false               |
| birth              | date   | null: false               |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| introduce        | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| charge_bearer_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :charge_bearer
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_date


## purchasesテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippingsテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    | 
| address       | string     | null: false                    |
| building      | string     | null: true                     |
| phone         | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |


### Association
- belongs_to :purchase
- belongs_to_active_hash :prefecture