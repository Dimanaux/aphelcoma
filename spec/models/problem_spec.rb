require "rails_helper"

describe Problem do
  context "with validations" do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :description }
  end

  context "with associations" do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :comments }
  end
end
