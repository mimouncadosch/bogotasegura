class RemoveLoactionStuffFromLoaction < ActiveRecord::Migration
  def up
    remove_column :loactions, :address
    remove_column :loactions, :latitude
    remove_column :loactions, :longitude
  end

  def down
    add_column :loactions, :longitude, :float
    add_column :loactions, :latitude, :float
    add_column :loactions, :address, :string
  end
end
