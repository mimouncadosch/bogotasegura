class RemoveSubscribersNameFromSubscribers < ActiveRecord::Migration
  def up
    remove_column :subscribers, :subscribers_name
  end

  def down
    add_column :subscribers, :subscribers_name, :string
  end
end
