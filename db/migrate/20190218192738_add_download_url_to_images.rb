class AddDownloadUrlToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :download_url, :string
  end
end
