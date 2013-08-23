class AddHourAndMinutesToCharaters < ActiveRecord::Migration
  def change
    add_column :charaters, :hour, :string
    add_column :charaters, :minute, :string
  end
end
