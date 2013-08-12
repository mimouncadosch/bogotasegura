class RemoveSubscribersCoordsFromSubscribers < ActiveRecord::Migration
  def up
    remove_column :subscribers, :remember_token
    remove_column :subscribers, :password_digest
    remove_column :subscribers, :subscriber_password_combination
  end

  def down
    add_column :subscribers, :subscriber_password_combination, :string
    add_column :subscribers, :password_digest, :string
    add_column :subscribers, :remember_token, :string
  end
end
