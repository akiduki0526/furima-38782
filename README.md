# テーブル設計

## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_day          | date    | null: false               |

has_many :items



## itemsテーブル

| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
| name                        | string     | null: false                    |
| explanation                 | string     | null: false                    |
| price                       | integer    | null: false                    |
| category_id                 | integer    | null: false                    |
| condition_id                | integer    | null: false                    |
| shipping_charge_id          | integer    | null: false                    |
| prefectures_id              | integer    | null: false                    |
| estimated_shipping_date_id  | integer    | null: false                    |
| user                        | references | null: false, foreign_key: true |

belongs_to :user
has_many :comments
has_many :item_comments

## purchaseテーブル

| Column          | Type     | Options     |
| --------------- | ---------- | ------------------------------ |
| card_number     | integer    | null: false                    |
| date_of_expiry  | integer    | null: false                    |
| security_code   | integer    | null: false                    |
| items           | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

belongs_to :item
belongs_to :shipping_address

## shipping_addressテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| post_code         | string     | null: false                    |
| prefectures_id    | integer    | null: false                    |
| district          | string     | null: false                    |
| address           | string     | null: false                    |
| building          | string     |                                |
| phone_number      | string     | null: false                    |
| purchase          | references | null: false, foreign_key: true |

belongs_to :purchase
