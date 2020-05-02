class ChangeProfilePictureToString < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :profile_picture, :string
  end
end
