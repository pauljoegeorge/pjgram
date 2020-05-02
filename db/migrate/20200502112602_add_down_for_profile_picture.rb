class AddDownForProfilePicture < ActiveRecord::Migration[6.0]
  def down
    add_column :users, :profile_picture, :string
  end
end
