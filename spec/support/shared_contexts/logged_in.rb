shared_context "logged in" do
  let(:current_user) { create :user }

  before do
    visit new_user_session_path
    fill_in :user_email, with: current_user.email
    fill_in :user_password, with: current_user.password
    click_button "Log in"
  end

  def log_out
    click_link "Log out"
  end
end
