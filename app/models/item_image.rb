class ItemImage < ApplicationRecord
  belongs_to :item, optional: true
  mount_uploader :image_url, ImageUploader


  def self.create_photos_by(item_image_params)

      return false if item_image_params[:image_url].nil?
    
      Item_image.transaction do 
    
        item_image_params[:image_url].each do |item_image|
          new_item_image = Item_image.new(title: item_image_params[:title], image_url: item_image)
          return false unless new_item_image.save!
        end
      end
    
      true
    end
end
