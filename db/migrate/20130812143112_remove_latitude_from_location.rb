class RemoveLatitudeFromLocation < ActiveRecord::Migration
  def up
    remove_column :locations, :latitude
    remove_column :locations, :longitude
  end

  def down
    add_column :locations, :longitude, :string
    add_column :locations, :latitude, :string
  end
end
