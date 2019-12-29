require "rails_helper"

describe Solution do
  include_context "when viewing problem"

  it "cannot be uploaded by anonymous user" do
    visit problem_path(problem)
    expect(page).not_to have_content "Create Solution"
  end
end
