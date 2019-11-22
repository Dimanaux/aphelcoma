require "rails_helper"

describe User do
  let(:old_user) { attributes_for :user }
  let(:new_user) { attributes_for :user }

  def join(user)
    visit new_user_registration_path
    fill_in :user_email, with: user[:email]
    fill_in :user_username, with: user[:username]
    fill_in :user_password, with: user[:password]
    fill_in :user_password_confirmation, with: user[:password_confirmation]
    click_button "Sign up"
  end

  before do
    join old_user
    click_link "Log out"
  end

  it "can register using correct data" do
    join(new_user)
    expect(page).to have_content "My account"
  end

  it "must be rejected if email exists" do
    join(old_user)
    expect(page).to have_content "Email has already been taken"
  end

  it "must be rejected with no username" do
    join new_user.merge(username: "")
    expect(page).to have_content "Username can't be blank"
  end
end
