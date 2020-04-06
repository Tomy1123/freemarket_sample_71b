class AddDeliveryAreaToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :delivery_area, :integer, null: false
  end
end
