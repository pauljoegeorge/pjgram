class Article < ApplicationRecord
  belongs_to :user
  class << self
    def markdown
      Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    end
  end
  # before_save :assign_markdown_content, if: -> { content_changed? }
  #
  # def assign_markdown_content
  #   assign_attributes({
  #                         markdown_content: self.class.markdown.render(content)
  #                     })
  # end
end