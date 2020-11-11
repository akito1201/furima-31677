# テーブル設計

## users テーブル

| Column          | Type   | Options                   |
| --------        | ------ | -----------               |
| email           | string | null: false               |
| password        | string | null: false               |
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
| image        | ActiveStorage   | null: false      |
| description  | text            | null: false      |
| condition    | string          | null: false      |
| shipping     | string          | null: false      |
| region       | string          | null: false      |
| days         | string          | null: false      |
| price        | string          | null: false      |
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
  belongs_to :address



  ## addresses テーブル

| Column     | Type      | Options           |
| ---------  | ------    | -----------       |
| zipcode    | srting    | null: false       |
| prefecture | string    | null: false       |
| city       | string    | null: false       |
| house      | string    | null: false       |
| telephone  | string    | null: false       |
| item       | references| foreign_key: true |

## association
  belongs_to :record
  belongs_to :item