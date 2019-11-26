module SolutionsHelper
  def solution_path(solution)
    problem_solution_path(solution.problem_id, solution)
  end

  def solutions_path(problem)
    problem_solutions_path(problem)
  end

  def new_solution_path(problem)
    new_problem_solution_path(problem)
  end
end
