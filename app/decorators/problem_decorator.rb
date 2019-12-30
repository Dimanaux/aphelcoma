class ProblemDecorator < ApplicationDecorator
  delegate :html, to: :decorated_description, prefix: :text
  delegate :link, to: :decorated_user, prefix: :author

  def preview
    object.description.lines.first
  end

  def views_count
    object.views.count
  end

  def comments
    object.comments.order(:created_at)
  end

  def created_at
    decorated_creation_date.to_s
  end

  private

  def decorated_creation_date
    @creation_date ||= DateDecorator.new(object.created_at)
  end

  def decorated_description
    @decorated_description ||= TextDecorator.new(object.description)
  end

  def decorated_user
    @decorated_user ||= object.user.decorate
  end
end
