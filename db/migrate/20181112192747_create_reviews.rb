class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.text :comments
      t.integer :rating
      t.references :route, foreign_key: true

      t.timestamps
    end
  end
end
