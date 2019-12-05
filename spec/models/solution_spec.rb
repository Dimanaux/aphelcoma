require "rails_helper"

describe Solution do
  context "with validations" do
    it { is_expected.to validate_presence_of :code }
  end

  context "with associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :problem }
  end
end
