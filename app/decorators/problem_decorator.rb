class ProblemDecorator < ApplicationDecorator
  delegate :html, to: :decorated_description, prefix: :text
  delegate :author_link, to: :decorated_user

  private

  def decorated_description
    @decorated_description ||= TextDecorator.new(object.description)
  end

  def decorated_user
    @decorated_user ||= UserDecorator.new(object.user)
  end
end
