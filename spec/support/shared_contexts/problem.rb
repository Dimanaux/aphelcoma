shared_context "problem" do
  let(:problem) { create :problem }

  before do
    visit problem_path(problem)
  end
end
