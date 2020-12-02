# README

## users テーブル

|Column                |Type    |Options     |
|----------------------|--------|------------|
|name                  |string  |null: false |
|email                 |string  |null: false |
|password              |string  |null: false |
|password_confirmation |string  |null: false |
|last_name             |string  |null: false |
|first_name            |string  |null: false |
|katakana_last_name    |string  |null: false |
|katakana_first_name   |string  |null: false |
|year                  |integer |null: false |
|month                 |integer |null: false |
|day                   |integer |null: false |

### Association

- has_many :items
- has_many :buys


## items テーブル

|Column        |Type       |Options           |
|--------------|-----------|------------------|
|image         |string     |null: false       |
|item_name     |string     |null: false       |
|explanation   |text       |null: false       |
|category      |integer    |null: false       |
|status        |integer    |null: false       |
|delivery      |integer    |null: false       |
|shipping_area |integer    |null: false       |
|shipping_days |integer    |null: false       |
|price         |integer    |null: false       |
|user_id       |references |foreign_key: true |

### Association

- belongs_to :user
- has_one :buy


## buys テーブル

|Column        |Type       |Options           |
|--------------|-----------|------------------|
|user_id       |references |foreign_key: true |
|item_id       |references |foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

|Column        |Type     |Options     |
|--------------|---------|------------|
|postal_code   |integer  |null: false |
|prefectures   |integer  |null: false |
|municipality  |string   |null: false |
|address       |string   |null: false |
|building      |string   |            |
|phone_number  |integer  |null: false |

### Association
- belongs_to :buy
