class AddPasswordToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :remember_token, :string
  end
end
