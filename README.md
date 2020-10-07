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
| birthday         | date   | null: false |
### Association
- has_many :purchases
- has_many :items
## items テーブル
| Column        | Type     | Options     |
| ------------- | -------- | ----------- |
| name          | string   | null: false |
| price         | integer  | null: false |
| category_id   | integer  | null: false |
| status_id     | integer  | null: false |
| user_id       | integer  | null: false, foreign_key: true |
| explanation   | text     | null: false |
### Association
- belongs_to :user
- has_one    :purchase
##  purchases テーブル
| Column        | Type     | Options     |
| ------------- | -------- | ----------- |
| user_id       | integer  | null: false, foreign_key: true |
| item_id       | integer  | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one    :address
- belongs_to :item
##  addresses テーブル
| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| street_address  | string  | null: false |
| phone_number    | string  | null: false |
| postal_code     | string  | null: false |
| prefecture      | integer | null: false |
| city            | string  | null: false |
| building_name   | string  |  |
| purchase_id     | integer | null: false, foreign_key: true |
### Association
- belongs_to :purchase

