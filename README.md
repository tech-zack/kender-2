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

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| email              | string |  NOT NULL unique :true  |
| encrypted_password | string |  NOT NULL               |
| nickname           | string |  NOT NULL               |

### Association

- has_many :messages
- has_many :kenders
- has_many :likes
- has_many :liked_kenders, through: :likes, source: :kender

## messages テーブル

| Column        | Type     | Options           |
| ------------- | -------- | ----------------- |
| text          | text     |  NOT NULL         |
| user_id       | integer  | foreigen_key:true |
| kender_id     | integer  | foreigen_key:true |

### Association

- belongs_to :kender
- belongs_to :user

## kenders テーブル

| Column      | Type          | Options             |
| ----------- | ------------- | ------------------- |
| title       | string        |  NOT NULL           |
| text        | text          |  NOT NULL           |
| image       | ActiveStorage | foreigen_key:true   |
| user_id     | references    | foreigen_key:true   |
| category_id | interger      |  NOT NULL           |

### Association

- belongs_to :user
- has_many :massages
- belongs_to :category
- has_many :likes
- has_many :liked_users, through: :likes, source: :user
- has_one_attached :image
  
  ## likes テーブル

| Column      | Type          | Options             |
| ----------- | ------------- | ------------------- |
| user_id     | integer       |  NOT NULL           |
| kender_id   | interger      |  NOT NULL           |


### Association

- belongs_to :user
- belongs_to :kender