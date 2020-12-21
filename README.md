# README
## Users

| Column       | Type           | Options                       |
| ------------ | -------------- | ----------------------------- |
| nickname     | string         | null: false                   |
| email        | string         | null: false                   |
| password     | string         | null: false                   |
| last_name    | string         | null: false                   |
| first_name   | string         | null: false                   |
| birth_date   |  date          | null: false                   |
| bought_item  | string         | null: false foreign_key: true |
| selling_item | string         | null: false foreign_key: true |
| sold_item    | string         | null: false foreign_key: true |

### Association
has many :items
has one :Shipping address
has one :Purchase records


## Items
| Column          | Type          | Options                 |
| --------------- | ------------- | ----------------------- |
| Item            | string        | null: false             |
| seller._id      | integer       | null: false,foreign key |
| description     | text          | null: false             |
| category        | string        | null: false             |
| condition       | string        | null: false             |
| shipping_charge | string        | null: false             |
| ship_from       | string        | null: false             |
| shipping_date   | string        | null: false             |
| price           | string        | null: false             |
| image           | ActiveStorage | null: false             |

### Association
has one :Shipping address
has one :Purchase records
belongs_to :user 


## Purchase records
| Column     | Type    | Options                 |
| ---------- | ------- | ----------------------- |
| buyer_id   | integer | null: false,foreign key |
| item       | string  | null: false,foreign key |

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
