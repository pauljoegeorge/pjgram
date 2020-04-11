class AddCommentsToArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :article_comments do |t|
      t.string :response
    end
    add_reference :article_comments, :articles, foreign_key: true
    add_reference :article_comments, :users, foreign_key: true
  end
end
