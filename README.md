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
| name             | string | null: false |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| identification   | string | null: false |
| History          | string | null: false |



### Association

- has_many :products
- has_many :street addresses


## products テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| image      | string | null: false |
| price      | string | null: false |
| category   | string | null: false |
| status     | string | null: false |

### Association

- belongs_to :users
- has_one :purchases
- has_many :products_street addresses


##  purchases テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| fee           | string | null: false |
| credit card   | string | null: false |

### Association

- belongs_to :products
- has_many :user

##  street addresses テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| street address  | string | null: false |
| phone number    | string | null: false |
| shipping time   | string | null: false |
| map             | string | null: false |


### Association

- belongs_to :user
- belongs_to :purchases

##  products_street addresses テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| products_ID        | string | null: false |
| street address_ID  | string | null: false |


### Association

- belongs_to :products
- belongs_to :street addresses