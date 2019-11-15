require "rails_helper"

feature "Creating problem" do
  include_context "logged in"

  let(:problem) { build(:problem, user: current_user) }

  def create_problem(problem)
    visit new_problem_path
    fill_in :problem_title, with: problem.title
    fill_in :problem_description, with: problem.description
    click_button "Create Problem"
  end

  it "creates a problem" do
    create_problem(problem)
    expect(page).to have_content "Problem was successfully created"
    expect(page).to have_content problem.title
  end

  it "forbids to create a problem for anonymous guest" do
    log_out
    visit problems_path
    expect(page).not_to have_content "New problem"
  end

  it "forbids problems with empty title" do
    visit new_problem_path
    fill_in :problem_description, with: problem.description
    click_button "Create Problem"
    expect(page).not_to have_content "Problem was successfully created"
    expect(page).to have_content "Title can't be blank"
  end

  it "forbids problems with empty description" do
    visit new_problem_path
    fill_in :problem_title, with: problem.title
    click_button "Create Problem"
    expect(page).not_to have_content "Problem was successfully created"
    expect(page).to have_content "Description can't be blank"
  end
end
