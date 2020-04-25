module ApplicationHelper
  def article_accessible?
    article = Article.find(params[:id])
    if article.user.id != current_user.id
      redirect_to(articles_path)
    end
  end

  def vocabulary_accessible?
    article = Vocabulary.find(params[:id])
    if article.user.id != current_user.id
      redirect_to(vocabularies_path)
    end
  end
end
