module ArticlesHelper
  # Return the tag names separated by a comma and space
  def tags_as_string
    tag_names.join(", ")
  end

# Split up the provided value by commas and (optional) spaces.
  def tags_as_string=(string)
    self.tag_names = string.split(/,\s*/)
  end

  def show_tags(article)
    if article.tag_names.present?
      render 'article_tags', article: article
    end
  end

  def following?(my_id, other_user_id)
    following = Follow.where(following_user_id: other_user_id, follower_user_id: my_id).first
    following.present?
  end
end
