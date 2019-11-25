require "rails_helper"

describe SolutionsHelper do
  let(:solution) { create(:solution) }

  it "solution_path" do
    expect(solution_path(solution)).to eq "/problems/#{solution.problem_id}/solutions/#{solution.id}"
  end

  it "solutions_path" do
    expect(solutions_path(solution.problem_id)).to eq "/problems/#{solution.problem_id}/solutions"
  end

  it "new_solution_path" do
    expect(new_solution_path(solution.problem_id)).to eq "/problems/#{solution.problem_id}/solutions/new"
  end
end
