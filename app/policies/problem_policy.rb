class ProblemPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end
 
  def update?
    user.present? && user == problem.user
  end
 
  def destroy?
    user.present? && user == problem.user
  end
 
  private

  def problem
    record
  end
end
