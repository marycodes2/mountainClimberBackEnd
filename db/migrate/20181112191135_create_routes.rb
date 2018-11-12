class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string :name
      t.string :type
      t.string :rating
      t.integer :pitches
      t.string :imgMedium
      t.float :longitude
      t.float :latitude
      t.integer :mpid
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
