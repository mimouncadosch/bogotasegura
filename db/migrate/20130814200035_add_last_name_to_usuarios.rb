class AddLastNameToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :last_name, :string
  end
end
