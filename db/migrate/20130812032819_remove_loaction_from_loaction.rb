class RemoveLoactionFromLoaction < ActiveRecord::Migration
  def up
    remove_column :loactions, :address
    remove_column :loactions, :latitude
  end

  def down
    add_column :loactions, :longitude
    add_column :loactions, :latitude, :string
    add_column :loactions, :address, :string
  end
end
