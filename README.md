# README

# テーブル設計

## users テーブル

| Column                 | Type   | Options                   |
| ---------------------- | ------ | ------------------------- |
| nickname               | string | null: false               |
| email                  | string | null: false, unique: true |
| password               | string | null: false               |
| password_confirmation  | string | null: false               |
| last_name              | string | null: false               |
| first_name             | string | null: false               | 
| kana_last_name         | string | null: false               |
| kana_first_name        | string | null: false               |
| birthday               | date   | null: false               |

### Association

- has_many :items, dependent: :destroy
- has_many :purchase_records

## items テーブル

| Column             | Type       | Options                            |
| ------------------ | ---------- | ---------------------------------- |
| item_name          | string     | null: false                        |
| content            | text       | null: false                        |
| category           | string     | null: false                        |
| status             | string     | null: false                        |
| delivery_charge    | string     | null: false                        |
| prefecture_of_ship | string     | null: false                        |
| days_to_ship       | string     | null: false                        |
| price              | integer    | null: false                        |
| user_id            | references | null: false, foreign_key: true     |

### Association

- belongs_to :user
- has_one :purchase_record
- has_one :address

##  purchase_records テーブル

| Column                 | Type       | Options                           |
| ---------------------- | ---------  | --------------------------------- |
| user_id                | references | null: false, foreign_key: true    |
| item_id                | references | null: false, foreign_key: true    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


##  addresses テーブル

| Column              | Type       | Options                            |
| ------------------  | ---------- | ---------------------------------- |
| post_code           | string     | null: false                        |
| prefecture_of_buyer | string     | null: false                        |
| municipality        | string     | null: false                        |
| house_number        | string     | null: false                        |
| building_name       | string     |                                    |
| telephone_number    | string     | null: false                        |
| item_id             | references | null: false, foreign_key: true     |
| purchase_record_id  | references | null: false, foreign_key: true     |

### Association

- belongs_to :item
- belongs_to :purchase_record