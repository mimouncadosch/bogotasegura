class RemoveSubscriberFromSubscriber < ActiveRecord::Migration
  def up
    remove_column :subscribers, :email
    remove_column :subscribers, :created_at
    remove_column :subscribers, :updated_at
    remove_column :subscribers, :latitude
    remove_column :subscribers, :longitude
  end

  def down
    add_column :subscribers, :longitude, :float
    add_column :subscribers, :latitude, :float
    add_column :subscribers, :updated_at, :datetime
    add_column :subscribers, :created_at, :datetime
    add_column :subscribers, :email, :string
  end
end
