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
| identification   | string | null: false |
| History          | string | null: false |



### Association

- has_many :users_products
- has_many :addresses


## products テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| name       | string  | null: false |
| image      | string  | null: false |
| price      | integer | null: false |
| category   | string  | null: false |
| status     | string  | null: false |

### Association

- has_many :users_products
- belongs  :purchases


##  purchases テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| fee           | integer | null: false |
| credit card   | string  | null: false |

### Association

- belongs_to :addresses
- has_many :products

##  addresses テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| street address  | string  | null: false |
| phone number    | integer | null: false |
| shipping time   | string  | null: false |
| map             | string  | null: false |


### Association

- belongs_to :users
- belongs_to :purchases

##  users_products テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| users_ID        | string | null: false |
| products_ID     | string | null: false |


### Association

- belongs_to :products
- belongs_to :street addresses