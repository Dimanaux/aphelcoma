require "rails_helper"

RSpec.describe "Log in", type: :feature do
  let(:user) { create :user }

  def log_in(email, password)
    visit new_user_session_path
    fill_in :user_email, with: email
    fill_in :user_password, with: password
    click_button "Log in"
  end

  it "logs in using correct credentials" do
    log_in(user.email, user.password)
    expect(page).to have_content("My account")
  end

  it "logs in using incorrect credentials" do
    log_in(user.email, "wrong password")

    expect(page).to have_content("Sign in")
    expect(page).to have_content("Invalid Email or password")
  end
end
