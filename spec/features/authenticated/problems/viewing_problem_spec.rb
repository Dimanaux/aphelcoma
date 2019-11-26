require "rails_helper"

describe Problem do
  include_context "when logged in"

  let(:problem) { create(:problem) }

  it "has 0 views when created" do
    expect(problem.views.count).to eq 0
  end

  it "'s views count increases on visit" do
    expect { visit problem_path(problem) }.to change { problem.views.count }.by 1
  end

  it "'s views count doesn't increase on second visit" do
    visit problem_path(problem)
    expect { visit problem_path(problem) }.to change { problem.views.count }.by 0
  end
end
