class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.references :following, foreign_key: { to_table: :users }, null: false
      t.references :follower, foreign_key: { to_table: :users }, null: false
      t.timestamps
    end
    add_index :follows, [:following_id, :follower_id], unique: true
  end
end
