require "rails_helper"

describe CommentsHelper do
  let(:comment) { create(:comment) }

  it "comment_path" do
    expect(comment_path(comment)).to eq "/problems/#{comment.problem_id}/comments/#{comment.id}"
  end

  it "edit_comment_path" do
    expect(edit_comment_path(comment)).to eq "/problems/#{comment.problem_id}/comments/#{comment.id}/edit"
  end

  it "comments_path" do
    expect(comments_path(comment.problem_id)).to eq "/problems/#{comment.problem_id}/comments"
  end
end
