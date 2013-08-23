class AddAmpmToCharaters < ActiveRecord::Migration
  def change
    add_column :charaters, :ampm, :string
  end
end
