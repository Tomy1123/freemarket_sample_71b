class RenameCategorieIdColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :categorie_id, :category_id
  end
end
