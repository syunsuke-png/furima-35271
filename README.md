# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day        | string | null: false |
| birth_day        | string | null: false |
| berth_day        | string | null: false |

### Association

- has_many :item
- has_one :card
- has_one :address

## items テーブル

 | Column      | Type       | Options                        |
 | ----------- | ---------- | ------------------------------ |
 | item_name   | string     | null: false                    |
 | description | string     | null: false                    |
 | category    | string     | null: false                    |
 | status      | string     | null: false                    |
 | judgment    | string     | null: false                    |
 | area        | string     | null: false                    |
 | days        | string     | null: false                    |
 | cost        | string     | null: false                    |
 | user        | references | null: false, foreign_key: true |

 ### Association

 - belongs_to :user
 - has_many :image

 ## image

 | Column | Type       | Options                        |
 | ------ | ---------- | ------------------------------ |
 | image  | string     | null: false                    |
 | item   | references | null: false, foreign_key: true |

 ### Association
 - belongs_to :item

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

 ## card

 | Column  | Type       | Options                        |
 | ------- | ---------- | ------------------------------ |
 | card_id | string     | null: false                    |
 | user    | references | null: false, foreign_key: true |

 ### Association

 - belongs_to :user
