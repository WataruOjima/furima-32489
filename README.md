# README
## Users

| Column              | Type           | Options                    |
| ------------------- | -------------- | ---------------------------|
| nickname            | string         | null: false                |
| email               | string         | null: false, unique: true  |
| encrypted_password  | string         | null: false                |
| last_name           | string         | null: false                |
| furigana_last_name  | string         | null: false                |
| first_name          | string         | null: false                |
| furigana_first_name | string         | null: false                |
| birth_date          | date           | null: false                |


### Association
has_many :items
has_many :Purchase_records


## Items
| Column             | Type           | Options                       |
| ------------------ | -------------- | ----------------------------- |
| item_name          | string         | null: false                   |
| user_id            | integer        | null: false,foreign_key: true |
| description        | text           | null: false                   |
| category_id        | integer        | null: false                   |
| condition_id       | integer        | null: false                   |
| price              | integer        | null: false                   |
| prefecture_id      | integer        | null: false                   |
| shipping_date_id   | integer        | null: false                   |
| shipping_charge_id | integer        | null: false                   |

### Association
has one :Purchase_record
belongs_to :user 


## Purchase_records
| Column              | Type     | Options                       |
| ------------------- | -------- | ----------------------------- |
| user_id             | integer  | null: false,foreign_key: true |
| item_id             | integer  | null: false,foreign_key: true |


### Association
has one :Shipping_address
belongs_to :user
belongs_to :item


## Shipping_address
| Column             | Type      | Options                       |
| ------------------ | --------- | ----------------------------- |
| zip_code           | string    | null: false                   |    
| prefecture_id      | integer   | null: false                   |
| city               | string    | null: false                   |
| address            | string    | null: false                   |
| building           | string    |                               |
| tel_number         | string    | null: false                   |
| purchase_record_id | integer   | null: false,foreign_key: true |

### Association
belongs_to :Purchase_record
