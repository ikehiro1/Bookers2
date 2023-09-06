class RemovePofileImageIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :pofile_image_id, :string
  end
end
