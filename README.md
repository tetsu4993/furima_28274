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
has_many :item
has_many :order


## items テーブル

| Column       | Type       | Options             |
| ------------ | ---------- | ------------------- |
| user         | references | null:false, FK:true |
| image_url    | string     | null:false          |
| title        | string     | null:false          |
| text         | text       | null:false          |
| condition_id | integer    | null:false          |
| category_id  | integer    | null:false          |
| fee_burden   | integer    | null:false          |
| area_burden  | integer    | null:false          |
| handing_time | integer    | null:false          |

### items association
belongs_to :user
has_one :order

## purchases テーブル

| Column        | Type       | Options             |
| ------------- | ---------- | ------------------- |
| orders        | references | null:false, FK:true |
| prefecture_id | integer    | null:false          |
| postcode      | string     | null:false          |
| city          | string     | null:false          |
| block         | string     | null:false          |
| building      | string     |                     |
| phone_number  | string     | null:false          |

### purchases association
belongs_to :order


## orders テーブル
| Column   | Type       | Options             |
| -------- | ---------- | ------------------- |
| items    | references | null:false, FK:true |
| user     | references | null:false, FK:true |

### orders association
has_one :parchase
belongs_to :user
belongs_to :item