class SolutionDecorator < ApplicationDecorator
  delegate :code
  delegate :link, to: :decorated_user, prefix: :author

  private

  def decorated_user
    @decorated_user ||= UserDecorator.new(object.user)
  end
end
