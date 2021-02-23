## users

| Column             | Type    | Options                  |
|--------------------|---------|--------------------------|
| nickname           | string  | null: false              |
| email              | string  | null: false,unique: true |
| encrypted_password | string  | null: false              |
| lastname           | string  | null: false              |
| firstname          | string  | null: false              |
| last_furigana      | string  | null: false              |
| first_furigana     | string  | null: false              |
| birthday           | date    | null: false              |

### Association
- has_many : items
- has_many : purchases

## items

| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| product_name | string     | null: false                    |
| description  | text       | null: false                    |
| price        | integer    | null: false                    |
| category_id  | integer    | null: false                    |
| status_id    | integer    | null: false                    |
| shipping_id  | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| estimate_id  | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |


### Association
- belongs_to : user
- has_one : purchase

## purchases

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item
- has_one :information

## informations

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| postalcode    | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

