class CreateItemImages < ActiveRecord::Migration[5.2]
  def change
    create_table :item_images do |t|
      t.integer :item_id
      t.string :image_url, null: false

      t.timestamps
    end
  end
end
