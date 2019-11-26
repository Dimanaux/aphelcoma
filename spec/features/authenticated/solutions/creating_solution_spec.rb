require "rails_helper"

describe Solution do
  include_context "when logged in"
  include_context "when viewing problem"

  let(:solution) { build(:solution, user: current_user) }

  def upload_solution(solution)
    visit problem_path(problem)
    click_link "Create Solution"
    fill_in :solution_code, with: solution.code
    click_button "Create Solution"
  end

  it "any user can upload a solution" do
    visit problem_path(problem)
    expect(page).to have_selector(:link_or_button, "Create Solution")
  end

  it "can be uploaded" do
    upload_solution solution
    expect(page).to have_content "Solution was successfully created"
    expect(page).to have_content solution.code
  end

  it "must have code" do
    visit new_problem_solution_path(problem)
    click_button "Create Solution"
    expect(page).to have_content "Code can't be blank"
  end
end
