class RemoveLoactinosFromLoactions < ActiveRecord::Migration
  def up
    remove_column :loactions, :address
    remove_column :loactions, :latitude
    remove_column :loactions, :longitude
    remove_column :loactions, :created_at
    remove_column :loactions, :updated_at
  end

  def down
    add_column :loactions, :updated_at, :datetime
    add_column :loactions, :created_at, :datetime
    add_column :loactions, :longitude, :float
    add_column :loactions, :latitude, :float
    add_column :loactions, :address, :string
  end
end
