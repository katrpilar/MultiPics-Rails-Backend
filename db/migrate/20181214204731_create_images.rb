class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :link
      t.string :brand
      t.string :photographer
      t.string :profile
      t.string :download
      t.integer :download_count

      t.timestamps
    end
  end
end
