class RenameImageColumnToItemImages < ActiveRecord::Migration[5.2]
  def change
      rename_column :item_images, :image_url, :image
  end
end 
