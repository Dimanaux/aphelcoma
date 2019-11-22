require "rails_helper"

describe User do
  context "with validations" do
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_uniqueness_of :username }
  end

  context "with associations" do
    it { is_expected.to have_many :problems }
    it { is_expected.to have_many :comments }
    it { is_expected.to have_many :solutions }
  end
end
