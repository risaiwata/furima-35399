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

### users テーブル

| Column   | Type  | Options     |
| -------- | ----- | ----------- |
|nickname  |string | null: false |
|email     |string | null: false |
|password  |string | null: false |
|name      |string | null: false |
|name_ruby |string | null: false |
|birthdate |string | null: false |

### Association
- has_many :products
- has_one :purchaser

### products テーブル

| Column         | Type      | Options     |
| -------------- | --------- | ----------- |
|title           |string     | null: false |
|text            |text       | null: false |
|category        |string     | null: false |
|delivery_charge |string     | null: false |
|area            |text       | null: false |
|days            |string     | null: false |
|price           |string     | null: false |
|user_id         |references | references  |

### Association

- belongs_to :user 
- has_one :purchasers

### purchasers テーブル

| Column     | Type      | Options     |
| ---------- | --------- | ----------- |
|card_number |text       | null: false |
|postal_code |text       | null: false |
|prefecture  |text       | null: false |
|city        |text       | null: false |
|address_line|text       | null: false |
|phonenumber |text       | null: false |
|user_id     |references | references  |
|products_id |references | references  |


### Association

- belongs_to :user
- belongs_to :products

