class AlterEstatesAddLatAndLng < ActiveRecord::Migration[5.2]
  def change
    add_column :estates, :latitude, :float
    add_column :estates, :longitude, :float
  end
end
