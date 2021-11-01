# テーブル設計

## user テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association
- has_many :items
- has_many :transactions
- has_one :profile

## profiles テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| birth_year      | integer    | null: false                    |
| birth_month     | integer    | null: false                    |
| birth_day       | integer    | null: false                    |
| first_name      | string     | null: false                    |
| last_name       | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| introduction    | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| delivery_fee    | string     | null: false                    |
| delivery_source | string     | null: false                    |
| until_delivery  | string     | null: false                    |
| price           | integer    | null: false, foreign_key: true |
| user            | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_one :transaction

## transactions テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postcode       | integer    | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| block          | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| until_delivery | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
