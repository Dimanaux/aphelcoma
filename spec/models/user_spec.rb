require "rails_helper"

describe User, type: :model do
  context "validations" do
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of :username }
  end

  context "associations" do
    it { should have_many :problems }
    it { should have_many :comments }
  end
end
