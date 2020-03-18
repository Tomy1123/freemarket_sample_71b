# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


### users　table
|Column	|Type	|Options|
|:------|:----|:------|
|nickname |string｜null: false	|
|family_name	|string	|null: false|
|first_name	|string	|null: false |
|family_name_kana	|string	|null: false|
|first_name_kana	|string	|null: false|
|birth_year	|string	|null: false|
|birth_month	|string	|null: false|
|birth_day	|string	|null: false|
|password	|string	|null: false|
|email	|string	|null: false, unique: true|
|status	|integer	|null: false|
|deleted_at	|datetime	|null: false|

### Association
has_many :items
has_many :comments dependent: :destroy




### items table
|Column	|Type	|Options|
|:------|:----|:------|
|category_id	|references	|null: false, FK: true|
|shipping_id	|references	|null: false. FK: true|
|brand_id	|references	|null: false. FK: true|
|seller_user_id	|references	|null: false, FK: true|
|name	|string	|null: false|
|text	|text	|null: false|
|condition	|integer	|null: false|
|price	|integer	|null: false|
|trading_status	|integer	|null: false|
|completed_at	|datetime	|

### Association
belongs_to :user
belongs_to :category
belongs_to :brand
has_many :comments dependent: :destroy
has_one :shipping
has_many :item_images dependent: :destroy



### item_images table
|Column	|Type	|Options|
|:------|:----|:------|
|item_id	|references	|null: false, FK: true|
|image_url	|string	|null: false|

### Association
belongs_to :item


### comments table
|Column	|Type	|Options|
|:------|:----|:------|
|user_id	|references	|null: false, FK: true|
|item_id	|references	|null: false, FK: true|
|text	|text	|null: false|

### Association
belongs_to :user
belongs_to :item


### categories table
|Column	|type	|Option|
|:------|:----|:-----|
|path	|text	|null: false|
|name	|string	|null: false|
<!-- |ancestry	|string	| -->

### Association
has_many :items
<!-- has_one :category_brand_group -->
has_one :brand_group, through: :category_brand_group
has_ancestry

### cards table
|Column	|type	|Option|
|:------|:----|:-----|
|user_id|integer|
|customer_id|string|
|card_id|string|

### Association
belongs_to :user


### brands table
|Column	|Type	|Options|
|:------|:----|:------|
|category_id	|references	|null: false, FK: true|
|name	|string	|null: false|

### Association
has_many :item
belongs_to :brand_group
belongs_to :category



<!-- ### brand-groups table
|Column	|Type	|Options|
|:------|:----|:------|
|name	|string	|null: false|

### Association
has_many :brands -->