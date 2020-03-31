class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :size
  belongs_to :item_condition
  belongs_to :delivery_charge
  has_many :likes,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :item_images,dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  belongs_to :brand
  belongs_to :condition
  belongs_to :size
  belongs_to :deliverycharge
  belongs_to :deliveryspend
end