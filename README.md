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

| Column        | Type   | Options     |
| --------------| ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| fam_name      | string | null: false |
| fir_name      | string | null: false |
| fam_kana_name | string | null: false |
| fir_kana_name | string | null: false |
| birthday      | date   | null: false |

### Association
- has_many :messages
- has_many :items



## items テーブル

| Column           | Type      | Options                        |
| ------ ----------| ----------| ------------------------------ |
| name             | string    | null: false                    |
| category         | integer   | null: false                    |
| image            | string    | null: false                    |
| text             | text      | null: false                    |
| status           | integer   | null: false                    |
| burden           | integer   | null: false                    |
| shipping_origin  | integer   | null: false                    |
| shipping_day     | integer   | null: false                    |
| price            | integer   | null: false                    |
| user             | references| null: false, foreign_key: true |

### Association

- has_many :messages
- belongs_to :user
- has_one : purchase


## messages テーブル

| Column     | Type       | Options                        |
| ------     | ---------- | ------------------------------ |
| comments   | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user


## purchase テーブル

| Column      | Type       | Options                        |
| -------     | ---------- | ------------------------------ |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


### address

| Column      | Type       | Options                        |
|------------ |------------|------------------------------- |
| postal      | string     | null: false                    |
| genre_id    | integer    | null: false                    |
| city        | string     | null: false                    |
| house_num   | string     | null: false                    |
| building    | string     | null: false                    |
| phone       | integer    | null: false                    |
| purchase    | references | null: false, foreign_key: true |


### Association
- belongs_to :purchase