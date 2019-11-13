class SolutionPolicy < ApplicationPolicy
  def index?
    # TODO: index only to problem's author
    user.present?
  end

  def show?
    index?
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
