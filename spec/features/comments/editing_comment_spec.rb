require "rails_helper"

describe "Editing comment" do
  include_context "logged in"
  include_context "problem"

  let(:my_comment) { create(:comment, user: current_user, problem: problem) }
  let(:edit_my_comment_path) { edit_problem_comment_path(problem, my_comment) }

  it "allows me to update my comment" do
    visit problem_path(my_comment.problem)
    expect(page).to have_link(href: edit_my_comment_path)
  end

  it "updates my comment" do
    visit problem_path(my_comment.problem)
    click_link "Edit", href: edit_my_comment_path
    new_text = "this comment was updated"
    fill_in :comment_text, with: new_text
    click_button "Update Comment"
    expect(page).to have_content "Comment was successfully updated"
    expect(page).to have_content new_text
  end
end
