class AddDataToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :height, :integer
    add_column :images, :key, :integer
    add_column :images, :metadata, :text
    add_column :images, :width, :integer
    add_column :images, :src, :string
  end
end
