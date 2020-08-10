# テーブル設計

## users テーブル

| Column           | Type   | Options                 |
| ---------------- | ------ | ----------------------- |
| nickname         | string | null:false              |
| e-mail           | string | null:false, unique:true |
| password         | string | null:false              |
| birthday         | date   | null:false              |
| family_name      | string | null:false              |
| first_name       | string | null:false              |
| family_name_kana | string | null:false              |
| first_name_kana  | string | null:false              |

### users association
has_many :items


## items テーブル

| Column       | Type       | Options             |
| ------------ | ---------- | ------------------- |
| user_id      | references | null:false, FK:true |
| image_url    | string     | null:false          |
| title        | string     | null:false          |
| text         | text       | null:false          |
| condition_id | integer    | null:false          |
| category_id  | integer    | null:false,         |
| fee_burden   | integer    | null:false          |
| area_burden  | integer    | null:false          |
| handing_time | integer    | null:false          |

### items association
belongs_to :users
has_one :purchases

## purchases テーブル

| Column        | Type    | Options             |
| ------------- | ------- | ------------------- |
| items_id      | string  | null:false, FK:true |
| prefecture_id | integer | null:false FK:true  |
| postcode      | string  | null:false          |
| city          | string  | null:false          |
| block         | string  | null:false          |
| building      | string  | null:false          |
| phone_number  | string  | null:false          |

### purchases assciation
belongs_to :items