require "rails_helper"

describe Problem do
  include_context "when logged in"

  let(:problem) { create(:problem, description: "__text__ `in` *markdown*") }

  it "is rendered with markdown" do
    visit problem_path(problem)
    expect(page).to have_content "text in markdown"
    expect(page).not_to have_content "__text__"
    expect(page).not_to have_content "`in`"
    expect(page).not_to have_content "*markdown*"
  end

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
