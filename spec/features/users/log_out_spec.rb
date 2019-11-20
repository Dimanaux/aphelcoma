require "rails_helper"

describe User do
  include_context "when logged in"

  it "can log out" do
    visit "/"
    click_link "Log out"
    expect(page).to have_content("Log in")
  end
end
