require "rails_helper"

describe Problem do
  include_context "when logged in"
  include_context "when viewing problem"

  let(:my_problem) { create(:problem, user: current_user) }

  def destroy_problem(problem)
    visit problem_path(problem)
    click_link "Destroy"
    page.accept_alert
  end

  it "can be destroyed by its author", js: true do
    destroy_problem(my_problem)
    expect(page).to have_content "Problem was successfully destroyed"
    expect(page).not_to have_content my_problem.title
  end

  it "cannot be destroyed by other users" do
    visit problem_path(problem)
    expect(page).not_to have_content "Destroy"
  end
end
