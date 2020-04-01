class Article < ApplicationRecord
  belongs_to :user

  #================= for tags ===============#
  Gutentag::ActiveRecord.call self
  #==========================================#
  #

  #=================markdown=================#
  class << self
    def markdown
      Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    end
  end
  #===========end of markdown=================#
end