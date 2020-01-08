class CommentDecorator < ApplicationDecorator
  delegate :link, to: :decorated_user, prefix: :author
  delegate :html, to: :decorated_text, prefix: :text

  def created_at
    decorated_creation_date.to_s
  end

  private

  def decorated_creation_date
    @decorated_creation_date ||= DateDecorator.new(object.created_at)
  end

  def decorated_text
    @decorated_text ||= TextDecorator.new(object.text)
  end

  def decorated_user
    @decorated_user ||= object.user.decorate
  end
end
