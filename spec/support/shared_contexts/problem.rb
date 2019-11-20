shared_context "when viewing problem" do
  let(:problem) { create :problem }

  before do
    visit problem_path(problem)
  end
end
