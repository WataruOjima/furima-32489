# README
## Users

| Column              | Type           | Options                       |
| ------------------- | -------------- | ----------------------------- |
| nickname            | string         | null: false                   |
| email               | string         | null: false                   |
| password            | string         | null: false                   |
| last_name           | string         | null: false                   |
| furigana_last_name  | string         | null: false                   |
| first_name          | string         | null: false                   |
| furigana_first_name | string         | null: false                   |
| birth_date          | date           | null: false                   |


### Association
has_many :items
has one :Shipping address
has one :Purchase records


## Items
| Column          | Type           | Options                 |
| --------------- | -------------- | ----------------------- |
| item            | string         | null: false             |
| user._id        | integer        | null: false,foreign key |
| description     | text           | null: false             |
| category        | integer        | null: false             |
| condition       | integer        | null: false             |

### Association
has one :Shipping address
has one :Purchase records
belongs_to :user 


## Purchase records
| Column     | Type     | Options                 |
| ---------- | -------- | ----------------------- |
| user_id    | integer  | null: false,foreign key |
| item_id      | integer  | null: false,foreign key |

### Association
has one Shipping address
belongs_to user
belongs_to item


## Shipping address
| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| zip_code        | string  | null: false |    
| prefecture_code | string  | null: false |
| city            | string  | null: false |
| building        | string  | null: false |
| tel_number      | string  | null: false |

### Association
belongs_to :Purchase records
belongs_to :user
belongs_to :item
