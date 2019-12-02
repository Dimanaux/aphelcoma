require "rails_helper"

describe SolutionPolicy do
  let(:user) { create :user }
  let(:problem) { create :problem }
  let(:other_solution) { create(:solution, problem: problem) }
  let(:solution) { create(:solution, user: user, problem: problem) }

  def index?
    SolutionPolicy.new(user, problem.solutions).index?
  end

  def show?
    SolutionPolicy.new(user, other_solution).show?
  end

  it "forbids user (that haven't uploaded solution) to view other solutions" do
    expect(index?).to eq false
    expect(show?).to eq false
  end

  it "allows user (that have uploaded solution) to view other solutions" do
    solution.id
    expect(index?).to eq true
    expect(show?).to eq true
  end
end
