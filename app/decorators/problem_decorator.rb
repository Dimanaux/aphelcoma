class ProblemDecorator < ApplicationDecorator
  include HasMarkdown

  def text
    object.description
  end
end
