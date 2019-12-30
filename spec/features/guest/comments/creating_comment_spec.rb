require "rails_helper"

describe Comment do
  include_context "when viewing problem"

  it "cannot be created by anonymous user" do
    visit problem_path(problem)
    expect(page).not_to have_content "Have something to say?"
    expect(page).not_to have_content "Create Comment"
  end
end
