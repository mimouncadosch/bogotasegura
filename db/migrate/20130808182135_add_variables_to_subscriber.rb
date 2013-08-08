class AddVariablesToSubscriber < ActiveRecord::Migration
  def change
    add_column :subscribers, :subscriber_name, :string
    add_column :subscribers, :subscriber_neighborhood, :string
  end
end
