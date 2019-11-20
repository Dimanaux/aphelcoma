require "rails_helper"

describe Problem do
  include_context "when logged in"

  let(:my_problem) { create(:problem, user: current_user) }
  let(:problem) { create(:problem) }

  def update_problem(problem, new_title)
    visit problem_path(problem)
    click_link "Edit"
    fill_in :problem_title, with: new_title
    click_button "Update Problem"
  end

  it "is allowed to be edited by its author" do
    visit problem_path(my_problem)
    expect(page).to have_content "Edit"
  end

  it "can be updated by its author" do
    new_title = "New title for #{my_problem.title}"
    update_problem(my_problem, new_title)
    expect(page).to have_content "Problem was successfully updated"
    expect(page).to have_content new_title
  end

  it "forbids empty field on edit" do
    update_problem(my_problem, "")
    expect(page).to have_content "Title can't be blank"
  end

  it "forbids to edit by other user" do
    visit problem_path(problem)
    expect(page).not_to have_content "Edit"
  end
end
