class AddPostcodeToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :postcode, :string, :null => false
    add_column :profiles, :prefecture, :string, :null => false
    add_column :profiles, :city, :string, :null => false
    add_column :profiles, :adress1, :string, :null => false
    add_column :profiles, :adress2, :string, :null => false
  end
end
