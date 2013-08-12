class RemoveSubscribersConfirmFromSubscribers < ActiveRecord::Migration
  def up
    remove_column :subscribers, :subscriber_password_confirmation
  end

  def down
    add_column :subscribers, :subscriber_password_confirmation, :string
  end
end
