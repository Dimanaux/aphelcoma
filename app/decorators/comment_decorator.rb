class CommentDecorator < ApplicationDecorator
  delegate :text

  include HasMarkdown
end
