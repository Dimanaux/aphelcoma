require "rails_helper"

describe "Destroying problem", js: true do
  include_context "logged in"
  include_context "problem"

  let(:my_problem) { create(:problem, user: current_user) }

  it "allows to destroy my problem" do
    visit problem_path(my_problem)
    expect(page).to have_content "Destroy"
    click_link "Destroy"
    page.accept_alert
    expect(page).to have_content "Problem was successfully destroyed"
    expect(page).not_to have_content my_problem.title
  end

  it "forbids to destroy other user's problem" do
    visit problem_path(problem)
    expect(page).not_to have_content "Destroy"
  end
end
