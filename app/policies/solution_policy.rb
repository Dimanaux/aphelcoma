class SolutionPolicy < ApplicationPolicy
  def index?
    user.solutions.where("problem_id = ?", solution.problem_id).exists?
  end

  def create?
    user.present?
  end

  def update?
    user.present? && user == solution.user
  end

  def destroy?
    update?
  end

  private

  def solution
    record
  end
end
