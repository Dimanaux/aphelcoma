require "rails_helper"

describe Problem, type: :model do
  context "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
  end

  context "associations" do
    it { should belong_to :user }
    it { should have_many :comments }
  end
end
