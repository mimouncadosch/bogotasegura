class RemoveSubscriberNameFromSubscribers < ActiveRecord::Migration
  def up
    remove_column :subscribers, :subscriber_name
  end

  def down
    add_column :subscribers, :subscriber_name, :string
  end
end
