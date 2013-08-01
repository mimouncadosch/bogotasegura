class AddOtherVariablesToCharaters < ActiveRecord::Migration
  def change
    add_column :charaters, :description, :text
    add_column :charaters, :cedula, :string
    add_column :charaters, :neighborhood, :string
  end
end
