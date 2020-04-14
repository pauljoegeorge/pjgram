class ArticleCommentsController < ApplicationController
  def create
    article_comment = ArticleComment.new(permitted_params(params))
    if article_comment.save
      redirect_to article_path(params[:article_comment][:article_id])
    else
      redirect_to root_path
    end
  end

  private

  def permitted_params(params)

    params.require(:article_comment).permit(:article_id, :user_id, :response)
  end
end
