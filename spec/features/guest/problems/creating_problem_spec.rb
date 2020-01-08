require "rails_helper"

describe Problem do
  it "cannot be created by anonymous user" do
    visit problems_path
    expect(page).not_to have_content "New problem"
  end
end
