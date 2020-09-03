# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | string | null: false |




### Association

- has_many :addresses


## item テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| name       | string  | null: false |
| price      | integer | null: false |
| category   | string  | null: false |
| status     | string  | null: false |

### Association

- has_many   :users_products
- belongs_to :purchases

- belongs_to_active_hash :category
- belongs_tp_active_hash :status

##  purchases テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| fee           | integer | null: false |
| credit_card   | string  | null: false |

### Association
- belongs_to :users
- belongs_to :addresses
- belongs_to :item

##  addresses テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| street_address  | string  | null: false |
| phone_number    | string  | null: false |
| postal_code     | string  | null: false |
| prefectures     | string  | null: false |
| city            | string  | null: false |
| building_name   | string  | null: false |

### Association

- belongs_to :users
- belongs_to :purchases

