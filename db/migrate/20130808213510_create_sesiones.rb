class CreateSesiones < ActiveRecord::Migration
  def change
    create_table :sesiones do |t|

      t.timestamps
    end
  end
end
