require "rails_helper"

describe Comment do
  include_context "when logged in"
  include_context "when viewing problem"

  let(:my_comment) { create(:comment, user: current_user, problem: problem) }
  let(:edit_my_comment_path) { edit_comment_path(my_comment) }

  def edit_comment_path(comment)
    edit_problem_comment_path(comment.problem, comment)
  end

  def update_comment(comment, new_text)
    visit problem_path(comment.problem)
    click_link "Edit", href: edit_my_comment_path
    fill_in :comment_text, with: new_text
    click_button "Update Comment"
  end

  it "is allowed to be edited by its author" do
    visit problem_path(my_comment.problem)
    expect(page).to have_link(href: edit_my_comment_path)
  end

  it "can be updated" do
    new_text = "this comment was updated"
    update_comment(my_comment, new_text)
    expect(page).to have_content "Comment was successfully updated"
    expect(page).to have_content new_text
  end
end
