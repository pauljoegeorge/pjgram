class DropColumnTagsFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :tags
  end
end
