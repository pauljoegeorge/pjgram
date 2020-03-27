module MarkdownHelper
  def markdown(text)
    unless @markdown
      options = {
          :fenced_code_blocks => true,
          :no_intra_emphasis => true,
          :autolink => true,
          :strikethrough => true,
          :lax_html_blocks => true,
          # :superscript => true,
          :tables => true,
          :with_toc_data => true
      }
      renderer = Redcarpet::Render::HTML.new(options)
      @markdown = Redcarpet::Markdown.new(renderer)
    end

    @markdown.render(text).html_safe
  end
end