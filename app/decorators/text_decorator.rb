class TextDecorator < ApplicationDecorator
  def html
    @html ||= TextDecorator.markdown_engine.render(object).html_safe
  end

  class << self
    def markdown_engine
      @markdown_engine ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true)
    end
  end
end
