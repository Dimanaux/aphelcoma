class View::Create
  include Interactor

  def call
    View.where(problem: context.problem, user: context.user).first_or_create
  end
end
