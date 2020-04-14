class CreateNewArticleComments < ActiveRecord::Migration[6.0]
  def change
    create_table :article_comments do |t|
      t.string :response, not_null: true
      t.timestamps
    end
    add_reference :article_comments, :user, foreign_key: true
    add_reference :article_comments, :article, foreign_key: true
  end
end

