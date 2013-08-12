class RemoveSubscriberNameFromSubscribers < ActiveRecord::Migration
  def up
    remove_column :subscribers, :subscriber_name
  end

end
