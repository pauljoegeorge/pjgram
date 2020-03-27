class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :head, null: false
      t.string :tags, array: true
      t.string :description, null: false
    end
    add_index :articles, :head, unique: true
    add_reference :articles, :user, foreign_key: true, unique: true
  end
end
