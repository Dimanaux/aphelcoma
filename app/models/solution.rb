class Solution < ApplicationRecord
  validates :code, presence: true

  belongs_to :user
  belongs_to :problem
end
