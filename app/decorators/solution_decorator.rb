class SolutionDecorator < ApplicationDecorator
  delegate :code
  delegate :link, to: :decorated_user, prefix: :author
  delegate :name, to: :decorated_user, prefix: :author
  delegate :title, to: :decorated_problem, prefix: :problem

  private

  def decorated_user
    @decorated_user ||= object.user.decorate
  end

  def decorated_problem
    @decorated_problem ||= object.problem.decorate
  end
end
