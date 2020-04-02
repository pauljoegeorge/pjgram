class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article.order('id DESC').page params[:page]
  end

  def new
    @article = Article.new
  end

  def create
    param = permitted_params(params)
    @article = Article.new param
    @article.tag_names = tags_as_array(params[:article][:tag_names])
    @article.user_id = current_user.id
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
    @article.head = params[:article][:head]
    @article.description = params[:article][:description]
    @article.tag_names = tags_as_array(params[:article][:tag_names])
    @article.save
    flash[:success] = "Updated successfully !!"
    redirect_to article_path(@article.id)
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    flash[:success] = "Deleted successfully !!"
    redirect_to articles_path
  end

  private

  def permitted_params(params)
    params.require(:article).permit(:head, :description)
  end

  def tags_as_array(tag_names)
    # tag_names.gsub!(/[^0-9A-Za-z:,]/, '').gsub!(/[tag:]/, '').split(',')
    formatted_tags_array = tag_names.gsub!(/[^0-9A-Za-z:,]/, '').split(',')
    formatted_tags_array.each do |tag|
      tag.slice!("tag:")
    end
    return formatted_tags_array
  end
end
