module ProblemsHelper
  def markdown(text)
    options = {
      fenced_code_blocks: true
    }
    markdown_to_html = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    markdown_to_html.render(text).html_safe
  end
end
