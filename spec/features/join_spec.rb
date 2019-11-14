require "rails_helper"

describe "Join", type: :feature do
  let(:old_user) { attributes_for :user }
  let(:new_user) { attributes_for :user }


  def fill_user_form(user)
    fill_in :user_email, with: user[:email]
    fill_in :user_username, with: user[:username]
    fill_in :user_password, with: user[:password]
    fill_in :user_password_confirmation, with: user[:password_confirmation]
  end

  def join(user)
    visit new_user_registration_path
    fill_user_form(user)
    click_button "Sign up"
  end

  def log_out
    click_link "Log out"
  end

  before do
    join old_user
    log_out
  end

  it "register user with correct data" do
    join(new_user)
    expect(page).to have_content "My account"
    log_out
  end

  it "rejects user with existing email" do
    join(old_user)
    expect(page).to have_content "Email has already been taken"
  end

  it "username is required" do
    visit new_user_registration_path
    fill_user_form(new_user)
    fill_in :user_username, with: ""
    click_button "Sign up"
    expect(page).to have_content "Username can't be blank"
  end
end
