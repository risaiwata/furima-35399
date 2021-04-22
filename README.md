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

| Column           | Type  | Options                  |
| ---------------- | ----- | ------------------------ |
|nickname          |string | null: false              |
|email             |string | null: false, unique: true|
|encrypted_password|string | null: false              |
|first_name        |string | null: false              |
|last_name         |string | null: false              |
|first_name_ruby   |string | null: false              |
|last_name_ruby    |string | null: false              |
|birthdate         |date   | null: false              |


### Association
- has_many :products
- has_one :purchaser

### products テーブル

| Column         | Type      | Options                      |
| -------------- | --------- | ---------------------------- |
|title           |string     | null: false                  |
|text            |text       | null: false                  |
|category        |string     | null: false                  |
|delivery_charge |integer    | null: false                  |
|product_status  |integer    | null: false                  |
|area            |integer    | null: false                  |
|delivery_day    |integer    | null: false                  |
|price           |integer    | null: false                  |
|user            |references | references,foreign_key: true |

### Association

- belongs_to :user 
- has_one :purchaser

### addresses テーブル

| Column     | Type      | Options                      |
| ---------- | --------- | ---------------------------- |
|postal_code |integer    | null: false                  |
|prefecture  |integer    | null: false                  |
|city        |string     | null: false                  |
|address_line|string     | null: false                  |
|phonenumber |integer    | null: false                  |

### Association

- belongs_to :user
- belongs_to :products

### purchasers テーブル

| Column     | Type      | Options                      |
| ---------- | --------- | ---------------------------- |
|user        |references | references,foreign_key: true |
|products    |references | references,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :products