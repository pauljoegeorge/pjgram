class AddCommentsToArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :article_comments do |t|
      t.string :response
      t.references :users, index: true
      t.references :articles, index: true

    end
  end
end
