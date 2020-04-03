class Item < ApplicationRecord
  # belongs_to :user
  # belongs_to :category
  has_many :item_images,dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  
  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :price, presence: true, numericality: { greater_than: 300, less_than: 9999999 }
  validates :item_images, length: { minimum: 1, maximum: 4}

end