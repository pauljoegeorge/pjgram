module ApplicationHelper
  def article_viewable?
    article = Article.find(params[:id])
    if !following?(current_user.id, article.user.id)
      redirect_to(articles_path)
    end
  end

  def article_full_access?
    article = Article.find(params[:id])
    if current_user.id != article.user.id
      redirect_to(articles_path)
    end
  end

  def vocabulary_accessible?
    vocabulary = Vocabulary.find(params[:id])
    if current_user.id != vocabulary.user.id
      redirect_to(vocabularies_path)
    end
  end

  def following?(me, other_user)
    Follow.where(following_user_id: other_user, follower_user_id: me).first.present?
  end
end
