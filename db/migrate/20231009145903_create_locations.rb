class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :category
      t.float :latitude
      t.float :longitude
      t.text :address

      t.timestamps
    end
  end
end
