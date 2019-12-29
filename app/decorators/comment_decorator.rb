class CommentDecorator < ApplicationDecorator
  delegate :html, to: :decorated_text, prefix: :text
  delegate :author_link, to: :decorated_user

  private

  def decorated_text
    @decorated_text ||= TextDecorator.new(object.text)
  end

  def decorated_user
    @decorated_user ||= UserDecorator.new(object.user)
  end
end
