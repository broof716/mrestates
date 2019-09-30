class CreateEstates < ActiveRecord::Migration[5.2]
  def change
    create_table :estates do |t|
      t.string :name
      t.text :description
      t.string :address
      t.integer :user_id
      t.timestamps
    end
    add_index :estates, :user_id
  end
end
