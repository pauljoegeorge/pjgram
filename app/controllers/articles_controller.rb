class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :article_accessible?, only: [:edit, :update, :show, :destroy]

  def index
    @articles = current_user.articles.order('id DESC').page params[:page]
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new permitted_params(params)
    if @article.valid?
      @article.save
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update permitted_params(params)
    flash[:success] = "Updated successfully !!"
    redirect_to article_path(@article.id)
  end

  def show
    @article = Article.find(params[:id])
    @article_comment = ArticleComment.new
    @article_comments = ArticleComment.where(article_id: params[:id])
    @visitor_id = current_user.id

  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    flash[:success] = "Deleted successfully !!"
    redirect_to articles_path
  end

  private

  def permitted_params(params)
    params.require(:article).permit(:head, :description).merge(
        user_id: current_user.id,
        tag_names: tags_as_array(params[:article][:tag_names]
        )
    )
  end

  def tags_as_array(tag_names)
    # tag_names.gsub!(/[^0-9A-Za-z:,]/, '').gsub!(/[tag:]/, '').split(',')
    formatted_tags_array = tag_names.gsub!(/[^0-9A-Za-z:,]/, '').split(',')
    formatted_tags_array.each do |tag|
      tag.slice!("tag:")
    end
    formatted_tags_array
  end
end
