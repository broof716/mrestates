class CreatePays < ActiveRecord::Migration[5.2]
  def change
    create_table :pays do |t|
      t.integer :user_id
      t.integer :marketplace_id
      t.timestamps
    end
    add_index :pays, [:user_id, :marketplace_id]
    add_index :pays, :marketplace_id
  end
end
