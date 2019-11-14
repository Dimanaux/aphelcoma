require "rails_helper"

describe Comment, type: :model do
  context "validations" do
    it { should validate_presence_of :text }
  end

  context "associations" do
    it { should belong_to :user }
    it { should belong_to :problem }
  end
end
