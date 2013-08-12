class RemoveLoactionsFromLoaction < ActiveRecord::Migration
  def up
    remove_column :loactions, :address
    remove_column :loactions, :latitude
    remove_column :loactions, :longitude
  end

  def down
    add_column :loactions, :longitude, :string
    add_column :loactions, :latitude, :string
    add_column :loactions, :address, :string
  end
end
