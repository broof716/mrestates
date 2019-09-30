class CreateEstates < ActiveRecord::Migration[5.2]
  def change
    create_table :estates do |t|
      t.string :name
      t.text :description
      t.string :address
      t.timestamps
    end
  end
end
