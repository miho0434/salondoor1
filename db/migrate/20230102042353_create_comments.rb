class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|

      t.text       :timestamps
      t.text       :atmosphere
      t.text       :growth_potential 
      t.text       :gap
      t.text       :treatment
      t.text       :reason_for_retirement
      t.references :worker,            null: false ,foreign_key: true
      t.references :salon,             null: false ,foreign_key: true

    end
  end
end
