# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| barth_day          | date   | null: false |

### Association

- has_many :item
- has_one :purchase
- has_one :address

## items テーブル

 | Column      | Type       | Options                        |
 | ----------- | ---------- | ------------------------------ |
 | item_name   | string     | null: false                    |
 | description | string     | null: false                    |
 | category_id | integer    | null: false                    |
 | status_id   | integer    | null: false                    |
 | judgment    | string     | null: false                    |
 | area_id     | integer    | null: false                    |
 | days_id     | integer    | null: false                    |
 | cost_id     | integer    | null: false                    |
 | user        | references | null: false, foreign_key: true |

 画像はActiveStorageを用いて実装

 ### Association

 - belongs_to :user
 - has_one :purchase

 ## addresses

 | Column       | Type       | Options                        |
 | ------------ | ---------- | ------------------------------ |
 | post_code    | string     | null: false                    |
 | prefecture   | string     | null: false                    |
 | city         | string     | null: false                    |
 | adress       | string     | null: false                    |
 | building_name| string     |                                |
 | phone_number | string     | null: false                    |
 | user         | references | null: false, foreign_key: true |

 ### Association

 - belongs_to :user

 ## purchases

 | Column  | Type       | Options                        |
 | ------- | ---------- | ------------------------------ |
 | item    | references | null: false, foreign_key: true |
 | user    | references | null: false, foreign_key: true |

 ### Association

 - belongs_to :user
 - belongs_to :item
