class AddNeighborhoodToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :neighborhood, :string
  end
end
