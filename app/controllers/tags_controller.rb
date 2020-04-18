class TagsController < ApplicationController

  def list
    @articles = Article.tagged_with(:names => [params[:tag_name]], :match => :any)
  end
end
