require "rails_helper"

describe View do
  context "with associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :problem }
  end
end
