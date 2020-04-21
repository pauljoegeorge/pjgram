class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.references :following_user, foreign_key: { to_table: :users }, null: false
      t.references :follower_user, foreign_key: { to_table: :users }, null: false
      t.timestamps
    end
    add_index :follows, [:follower_user_id, :following_user_id], unique: true
  end
end
