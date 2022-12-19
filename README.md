# テーブル設計

## usersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last-name          | string  | null: false |
| first-name         | string  | null: false |
| last-name-kana     | string  | null: false |
| first-name-kana    | string  | null: false |
| birth-year         | integer | null: false |
| birth-month        | integer | null: false |
| birth-day          | integer | null: false |

has_many :items



## itemsテーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| name                     | string     | null: false                    |
| explanation              | string     | null: false                    |
| price                    | integer    | null: false                    |
| category                 | string     | null: false                    |
| condition                | string     | null: false                    |
| shipping-charge          | string     | null: false                    |
| region-of-origin         | string     | null: false                    |
| estimated-shipping-date  | string     | null: false                    |
| user                     | references | null: false, foreign_key: true |

belongs_to :users
has_many :comments
has_many :item_comments

## commentsテーブル

| Column                   | Type    | Options     |
| ------------------------ | ------- | ----------- |
| content                  | text    | null: false |

has_many :items
has_many :item_comments

## item_commentsテーブル
| Column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| item      | references | null: false,foreign_key: true |
| comment   | references | null: false,foreign_key: true |

belongs_to :comments
belongs_to :items

## purchaseテーブル

| Column          | Type     | Options     |
| --------------- | ---------- | ------------------------------ |
| card-number     | integer    | null: false                    |
| date-of-expiry  | integer    | null: false                    |
| security-code   | integer    | null: false                    |
| items           | references | null: false, foreign_key: true |

belongs_to :items
belongs_to :shippingaddress

## shipping-addressテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post-code      | integer    | null: false                    |
| prefectures    | string     | null: false                    |
| district       | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     | null: false                    |
| phone-number   | integer    | null: false                    |
| purchase       | references | null: false, foreign_key: true |

belongs_to :purchase
