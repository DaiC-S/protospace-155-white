# テーブル設計

## users テーブル

| Column                  | Type   | Options     |
| ----------------------- | ------ | ------------|
| email                   | string | null: false | 
| password  　　　　　　    | string | null: false |
| name                    | string | null: false |
| profile                 | string | null: false |
| occupation              | string | null: false |
| position                | string | null: false |

### Association

- has_many :prototypes
- has_many :comments


## prototypes テーブル

| Column                  | Type       | Options                        |
| ----------------------- | -----------| ------------------------------ |
| user                    | references | null: false, foreign_key: true |
| prototype_name          | string     | null: false                    | 
| catchphrase             | ◯◯◯       | null: false                    | #string? or text?
| concept                 | ◯◯◯    | null: false                    | #string? or text?
| image                   | ◯◯◯    | null: false                    | #activestrage使う？確認まだ

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column                  | Type       | Options                        |
| ----------------------- | -----------| ------------------------------ |
| user                    | references | null: false, foreign_key: true |
| prototype               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :prototype