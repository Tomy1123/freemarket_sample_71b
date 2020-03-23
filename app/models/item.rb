class Item < ApplicationRecord
  belongs_to :category_id
  belongs_to :shipping_id
  belongs_to :brand_id
  belongs_to :seller_user_id
end
