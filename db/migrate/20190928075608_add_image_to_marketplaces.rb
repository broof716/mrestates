class AddImageToMarketplaces < ActiveRecord::Migration[5.2]
  def change
    add_column :marketplaces, :image, :string
  end
end
