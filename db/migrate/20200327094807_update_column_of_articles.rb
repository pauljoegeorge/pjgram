class UpdateColumnOfArticles < ActiveRecord::Migration[6.0]
  def change
    change_column :articles, :description, :text
  end
end
