require "rails_helper"

describe Comment do
  include_context "when logged in"
  include_context "when viewing problem"

  let(:comment) { build(:comment, user: current_user) }

  def create_comment(comment)
    visit problem_path(problem)
    fill_in :comment_text, with: comment.text
    click_button "Create Comment"
  end

  it "creates comment" do
    create_comment comment
    expect(page).to have_content "Comment was successfully created."
    expect(page).to have_content comment.text
  end

  it "with no text is forbidden" do
    visit problem_path(problem)
    click_button "Create Comment"
  end
end
