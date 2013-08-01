class AddGmapsToCharaters < ActiveRecord::Migration
  def change
    add_column :charaters, :gmaps, :boolean
  end
end
