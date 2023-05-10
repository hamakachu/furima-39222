# README

## userテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_kana        | string | null: false |
| first_kana         | string | null: false |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| introduce     | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| price         | integer    | null: false                    |
| shipping_date | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase



## purchasesテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippingsテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_cord | string     | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    | 
| address     | string     | null: false                    |
| building    | string     | null: true                     |
| phone       | integer    | null: false                    |
| purchase_id | references | null: false, foreign_key: true |


### Association
belongs_to :purchase
