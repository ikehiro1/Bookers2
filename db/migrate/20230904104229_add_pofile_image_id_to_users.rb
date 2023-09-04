class AddPofileImageIdToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :pofile_image_id, :string
  end
end
