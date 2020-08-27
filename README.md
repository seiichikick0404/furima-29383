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
| mail          | string | null: false |
| password      | string | null: false |
| fam_name      | string | null: false |
| fir_name      | date   | null: false |
| fam_kana_name | date   | null: false |
| fir_kana_name | date   | null: false |
| birthday      | date   | null: false |

### Association




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
- has_one : address

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
| credit_id   | integer    | null: false                    |
| expiration  | integer    | null: false                    |
| cvv         | integer    | null: false                    |
| item_id     | references | null: false, foreign_key: true |
| user_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


### address

| Column      | Type       | Options                        |
|------------ |------------|------------------------------- |
| postal      | integer    | null: false                    |
| prefectures | string     | null: false                    |
| city        | string     | null: false                    |
| house_num   | string     | null: false                    |
| building    | string     | null: false                    |
| phone       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase