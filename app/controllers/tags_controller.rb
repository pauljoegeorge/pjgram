class TagsController < ApplicationController

  def list
    @articles = current_user.articles.tagged_with(:names => [params[:tag_name]], :match => :any)
  end
end
