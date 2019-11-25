module HasMarkdown
  def markdown
    HasMarkdown.md.render(text).html_safe
  end

  @md = nil

  def self.md
    @md ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true)
  end
end
