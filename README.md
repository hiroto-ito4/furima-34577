## users

| Column        | Type    | Options     |
|---------------|---------|-------------|
| nickname      | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| lastname      | string  | null: false |
| firstname     | string  | null: false |
| last_furigana | string  | null: false |
| first_furigana| string  | null: false |
| year          | integer | null: false |
| month         | integer | null: false |
| day           | integer | null: false |

### Association
- has_many : items
- has_many : purchases

## items

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| price    | integer    | null: false                    |
| status   | string     | null: false                    |
| shipping | string     | null: false                    |
| area     | string     | null: false                    |
| estimate | string     | null: false                    |
| user_id  | references | null: false, foreign_key: true |


### Association
- belongs_to : user
- has_one : purchase

## purchases

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| user_id  | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item
- has_one :information

## informations

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| postalcode    | string     | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| purchase_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase

