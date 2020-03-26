class Item < ApplicationRecord
  belongs_to :categorie_id
  belongs_to :shipping_id
  belongs_to :brand_id
  belongs_to :seller_user_id
  # belongs_to user, foreign_key: 'user_id'
  belongs_to :category
end
