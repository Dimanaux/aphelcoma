require "rails_helper"

describe User do
  let(:user) { create(:user) }

  it "is shown by username" do
    visit user_path(user.username)
    expect(page).to have_content user.username
  end
end
