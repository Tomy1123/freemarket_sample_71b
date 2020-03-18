class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname, null: false	
      t.string :family_name, null: false	
      t.string :first_name, null: false	
      t.string :family_name_kana, null: false	
      t.string :first_name_kana, null: false	
      t.string :birth_year, null: false	
      t.string :birth_month, null: false	
      t.string :birth_day, null: false	
      t.string :password, null: false	
      t.string :email, null: false	,unique: true
      t.integer :status, null: false	
      t.datetime :deleted_at, null: false	

      t.timestamps
    end
  end
end
