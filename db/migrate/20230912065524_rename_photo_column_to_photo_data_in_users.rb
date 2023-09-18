class RenamePhotoColumnToPhotoDataInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :photo, :photo_data
  end
end
