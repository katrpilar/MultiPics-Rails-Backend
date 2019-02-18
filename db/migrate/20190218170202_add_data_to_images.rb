class AddDataToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :height, :integer
    add_column :images, :metadata, :json, default: {}
    add_column :images, :width, :integer
    add_column :images, :src, :string
  end
end
