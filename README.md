# テーブル設計

## users テーブル

| Column             | Type   | Options      |            |
| ------------------ | ------ | -----------  |            |
| nickname           | string | null: false  |            |
| email              | string | unique: true, null: false |
| encrypted_password | string | null: false  |            |
| family_name        | string | null: false  |            |
| first_name         | string | null: false  |            |
| family_name_kana   | string | null: false  |            |
| first_name_kana    | string | null: false  |            |
| barth_day          | date   | null: false  |            |

### Association

- has_many :items
- has_many :purchases

## items テーブル

 | Column      | Type       | Options                        |
 | ----------- | ---------- | ------------------------------ |
 | item_name   | string     | null: false                    |
 | description | text       | null: false                    |
 | category_id | integer    | null: false                    |
 | status_id   | integer    | null: false                    |
 | judgment_id | integer    | null: false                    |
 | area_id     | integer    | null: false                    |
 | days_id     | integer    | null: false                    |
 | cost        | integer    | null: false                    |
 | user        | references | null: false, foreign_key: true |

 画像はActiveStorageを用いて実装

 ### Association

 - belongs_to :user
 - has_one :purchase

 ## addresses

 | Column       | Type       | Options                        |
 | ------------ | ---------- | ------------------------------ |
 | post_code    | string     | null: false                    |
 | area_id      | integer    | null: false                    |
 | city         | string     | null: false                    |
 | address      | string     | null: false                    |
 | building_name| string     |                                |
 | phone_number | string     | null: false                    |
 | purchase     | references | null: false, foreign_key: true |

 ### Association

 - belongs_to :purchase

 ## purchases

 | Column  | Type       | Options                        |
 | ------- | ---------- | ------------------------------ |
 | item    | references | null: false, foreign_key: true |
 | user    | references | null: false, foreign_key: true |

 ### Association

 - belongs_to :user
 - belongs_to :item
 - has_one :address