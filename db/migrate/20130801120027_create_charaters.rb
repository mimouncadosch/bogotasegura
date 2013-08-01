class CreateCharaters < ActiveRecord::Migration
  def change
    create_table :charaters do |t|
      t.string :name
      t.date :date
      t.string :tipo
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
