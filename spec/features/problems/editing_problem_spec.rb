require "rails_helper"

describe "Editing problem" do
  include_context "logged in"

  let(:my_problem) { create(:problem, user: current_user) }
  let(:problem) { create(:problem) }

  it "allows to edit my problem" do
    visit problem_path(my_problem)
    expect(page).to have_content "Edit"
  end

  it "edits my problem" do
    visit problem_path(my_problem)
    new_title = "New problem's title"
    click_link "Edit"
    fill_in :problem_title, with: new_title
    click_button "Update Problem"
    expect(page).to have_content "Problem was successfully updated"
    expect(page).to have_content new_title
  end

  it "forbids empty field on edit" do
    visit problem_path(my_problem)
    click_link "Edit"
    fill_in :problem_title, with: ""
    click_button "Update Problem"
    expect(page).to have_content "Title can't be blank"
    expect(page).not_to have_content "Problem was successfully updated"
  end

  it "forbids to edit other user's problem" do
    visit problem_path(problem)
    expect(page).not_to have_content "Edit"
  end
end
