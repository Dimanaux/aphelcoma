class SolutionPolicy < ApplicationPolicy
  def index?
    return false unless user

    user_ids = Solution.where(record.where_values_hash).pluck(:user_id)
    user_ids.include? user.id
  end

  def show?
    user && Solution.where(problem_id: solution.problem_id, user_id: user.id).exists?
  end

  def create?
    user.present?
  end

  def update?
    user && user == solution.user
  end

  def destroy?
    update?
  end

  private

  def solution
    record
  end
end
