module ProblemsHelper
  def markdown(text)
    # options = {
    #   :fenced_code_blocks => true,
    #   :no_intra_emphasis => true,
    #   :autolink => true,
    #   :lax_html_blocks => true,
    # }
    markdown_to_html = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown_to_html.render(text).html_safe
  end
end
