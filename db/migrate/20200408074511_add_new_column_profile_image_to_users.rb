class AddNewColumnProfileImageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile_picture, :json
  end
end
