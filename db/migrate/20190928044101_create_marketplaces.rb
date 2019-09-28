class CreateMarketplaces < ActiveRecord::Migration[5.2]
  def change
    create_table :marketplaces do |t|
      t.string :title
      t.text :description
      t.decimal :cost
      t.integer :user_id
      t.timestamps
    end
    add_index :marketplaces, :user_id
  end
end
