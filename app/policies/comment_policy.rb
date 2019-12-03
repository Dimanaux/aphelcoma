class CommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    user.present? && user == comment.user
  end

  def destroy?
    update?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def comment
    record
  end
end
