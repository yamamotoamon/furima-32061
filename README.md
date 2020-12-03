# README

## users テーブル

|Column                |Type    |Options     |
|----------------------|--------|------------|
|name                  |string  |null: false |
|email                 |string  |null: false |
|encrypted_password    |string  |null: false |
|last_name             |string  |null: false |
|first_name            |string  |null: false |
|katakana_last_name    |string  |null: false |
|katakana_first_name   |string  |null: false |
|birthday              |date    |null: false |

### Association

- has_many :items
- has_many :buys


## items テーブル

|Column           |Type       |Options           |
|-----------------|-----------|------------------|
|item_name        |string     |null: false       |
|explanation      |text       |null: false       |
|category_id      |integer    |null: false       |
|status_id        |integer    |null: false       |
|delivery_id      |integer    |null: false       |
|shipping_area_id |integer    |null: false       |
|shipping_days_id |integer    |null: false       |
|price            |integer    |null: false       |
|user_id          |references |foreign_key: true |

### Association

- belongs_to :user
- has_one :buy


## buys テーブル

|Column  |Type       |Options           |
|--------|-----------|------------------|
|user    |references |foreign_key: true |
|item    |references |foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

|Column            |Type       |Options           |
|------------------|-----------|------------------|
|postal_code       |integer    |null: false       |
|shipping_area_id  |integer    |null: false       |
|municipality      |string     |null: false       |
|address           |string     |null: false       |
|building          |string     |                  |
|phone_number      |integer    |null: false       |
|buy_id            |references |foreign_key: true |

### Association
- belongs_to :buy
