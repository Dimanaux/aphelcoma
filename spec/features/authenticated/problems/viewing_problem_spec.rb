require "rails_helper"

describe Problem do
  let(:problem) { create(:problem, description: "__text__ `in` *markdown*") }

  it "is rendered with markdown" do
    visit problem_path(problem)
    expect(page).to have_content "text in markdown"
    expect(page).not_to have_content "__text__"
    expect(page).not_to have_content "`in`"
    expect(page).not_to have_content "*markdown*"
  end
end
