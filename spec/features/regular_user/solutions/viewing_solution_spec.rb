require "rails_helper"

describe Solution do
  include_context "when logged in"
  include_context "when viewing problem"

  let(:my_solution) { build(:solution, user: current_user, problem: problem) }
  let(:solution) { create(:solution, problem: problem, code: "pass phrase") }

  def upload_solution(solution)
    visit problem_path(problem)
    click_link "Create Solution"
    fill_in :solution_code, with: solution.code
    click_button "Create Solution"
  end

  it "user can't see solutions before submitting his one" do
    visit problem_path(problem)
    expect(page).not_to have_content "Solutions"

    visit problem_solutions_path(problem)
    expect(page).not_to have_content solution.code
    expect(page).to have_content "You are not allowed to perform this action"
  end

  it "user can't visit any solution directly before submitting his one" do
    visit solution_path(solution)
    expect(page).to have_content "You are not allowed to perform this action"
  end

  it "user can see other's solutions after submitting his one" do
    upload_solution(my_solution)
    visit problem_solutions_path(solution.problem)
    expect(page).to have_content solution.code
  end
end
