class AddVariablesToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :subscriber_password, :string
    add_column :subscribers, :subscriber_password_confirmation, :string
  end
end
