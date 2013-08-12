class RemoveSesionesFromSesiones < ActiveRecord::Migration
  def up
    remove_column :sesiones, :created_at
    remove_column :sesiones, :updated_at
  end

  def down
    add_column :sesiones, :updated_at, :datetime
    add_column :sesiones, :created_at, :datetime
  end
end
