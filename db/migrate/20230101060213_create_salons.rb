class CreateSalons < ActiveRecord::Migration[6.0]
  def change
    create_table :salons do |t|

      t.timestamps
      t.string :store_name,         null: false
      t.string :corporate_name,     null: false
      t.integer :prefecture_id,     null: false
      t.string :city,               null: false
      t.string :street_number,      null: false
      t.string :building_name
      t.string :station,            null: false
      t.integer :established,       null: false 
      t.integer :offices,           null: false 
    end
  end
end
