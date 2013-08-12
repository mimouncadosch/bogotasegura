class RemoveSubscribersDataFromSubscribers < ActiveRecord::Migration
  def up
    remove_column :subscribers, :subscriber_neighborhood
    remove_column :subscribers, :subscriber_password
    remove_column :subscribers, :subscriber_password_combination
  end

  def down
    add_column :subscribers, :subscriber_password_combination, :string
    add_column :subscribers, :subscriber_password, :string
    add_column :subscribers, :subscriber_neighborhood, :string
  end
end
