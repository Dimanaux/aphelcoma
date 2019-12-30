require "rails_helper"

describe Problem do
  include_context "when logged in"

  let(:problem) { attributes_for(:problem, user: current_user) }

  def create_problem(problem)
    visit new_problem_path
    fill_in :problem_title, with: problem[:title]
    fill_in :problem_description, with: problem[:description]
    click_button "Create Problem"
  end

  it "can be created" do
    create_problem(problem)
    expect(page).to have_content "Problem was successfully created"
    expect(page).to have_content problem[:title]
  end

  it "must have a title" do
    create_problem problem.merge(title: "")
    expect(page).not_to have_content "Problem was successfully created"
    expect(page).to have_content "Title can't be blank"
  end

  it "must have a description" do
    create_problem problem.merge(description: "")
    expect(page).not_to have_content "Problem was successfully created"
    expect(page).to have_content "Description can't be blank"
  end
end
