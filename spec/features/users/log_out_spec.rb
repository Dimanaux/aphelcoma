require "rails_helper"

describe "Log out" do
  include_context "logged in"

  it "User logs out" do
    visit "/"
    click_link "Log out"
    expect(page).to have_content("Log in")
  end
end
