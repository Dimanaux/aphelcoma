require "rails_helper"

describe CommentsHelper do
  let(:comment) { create(:comment) }

  it "comments_path" do
    expect(comments_path(comment.problem_id)).to eq "/problems/#{comment.problem_id}/comments"
  end
end
