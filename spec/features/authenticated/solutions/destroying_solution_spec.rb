require "rails_helper"

describe Solution do
  include_context "when logged in"
  include_context "when viewing problem"

  let(:my_solution) { create(:solution, user: current_user, problem: problem) }

  def destroy_solution(solution)
    visit problem_solutions_path(solution.problem)
    click_link "Destroy"
    page.accept_alert
  end

  it "can be destroyed by its author", js: true do
    destroy_solution(my_solution)
    expect(page).to have_content "Solution was successfully destroyed"
    expect(page).not_to have_content my_solution.code
  end
end
