class RemoveUsersFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :name
    remove_column :users, :email
    remove_column :users, :login
    remove_column :users, :created_at
    remove_column :users, :updated_at
  end

  def down
    add_column :users, :updated_at, :datetime
    add_column :users, :created_at, :datetime
    add_column :users, :login, :string
    add_column :users, :email, :string
    add_column :users, :name, :string
  end
end
