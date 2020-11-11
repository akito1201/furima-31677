# テーブル設計

## users テーブル

| Column          | Type   | Options                   |
| --------        | ------ | -----------               |
| email           | string | null: false, unique: true |
| encrypted_password| string | null: false             |
| nickname        | string | null: false, unique: true |
| birthday        | date   | null: false               |
| last_name       | string | null: false               | 
| first_name      | string | null: false               |
| kana_last_name  | string | null: false               |
| kana_first_name | string | null: false               |

## association
has_many :items
has_many :records



## items テーブル

| Column       | Type            | Options          |
| ---------    | ------          | -----------      |
| name         | string          | null: false      |
| description  | text            | null: false      |
| category_id  | integer         | null: false      |
| condition_id | integer         | null: false      |
| shipping_id  | integer         | null: false      |
| region_id    | integer         | null: false      |
| days_id      | integer         | null: false      |
| price        | integer         | null: false      |
| user         | references      | foreign_key: true |

## association
  belongs_to :user
  has_one :record
  has_one :address

  


## records テーブル

| Column     | Type          | Options           |
| ---------  | ------        | -----------       |
| time       | datetime      | null: false       |
| item       | references    | null: false       |
| user       | references    | foreign_key: true |

## association
  belongs_to :user
  belongs_to :item



  ## addresses テーブル

| Column        | Type      | Options           |
| ---------     | ------    | -----------       |
| zipcode       | integer   | null: false       |
| prefecture_id | integer   | null: false       |
| city          | string    | null: false       |
| house         | string    | null: false       |
| telephone     | integer   | null: false       |
| record        | references| foreign_key: true |

## association
  belongs_to :record