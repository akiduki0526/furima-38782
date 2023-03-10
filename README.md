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
has_many :purchases



## itemsテーブル

| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
| name                        | string     | null: false                    |
| explanation                 | text       | null: false                    |
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
has_one :purchase

## purchaseテーブル

| Column          | Type     | Options                          |
| --------------- | ---------- | ------------------------------ |
| item            | references | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

belongs_to :item
has_one :shipping_address
belongs_to :user

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
