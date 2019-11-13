require "rails_helper"

describe Comment, type: :model do
  context "associations" do
    it { should belong_to :user }
  end
end
