class CreateMountainProjectScrapers < ActiveRecord::Migration[5.2]
  def change
    create_table :mountain_project_scrapers do |t|
      t.timestamps
    end
  end
end
