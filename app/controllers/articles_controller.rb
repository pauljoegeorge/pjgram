class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def new
    @article = Article.new
  end

  def create
    param = permitted_params(params)
    @article = Article.new param
    @article.user_id = current_user.id
    if @article.valid?
      @article.save
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def index
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def permitted_params(params)
    params.require(:article).permit(:head, :description, :tags)
  end
end
