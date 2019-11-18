require "rails_helper"

describe "Creating comment as user" do
  include_context "logged in"
  include_context "problem"

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
end

describe "Creating comment as anonymous" do
  include_context "problem"

  it "forbids comments from unauthorized users" do
    visit problem_path(problem)
    expect(page).not_to have_content "Have something to say?"
    expect(page).not_to have_content "Create Comment"
  end
end
