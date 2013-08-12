class AddEmailToCharaters < ActiveRecord::Migration
  def change
    add_column :charaters, :email, :string
  end
end
