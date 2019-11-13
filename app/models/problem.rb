class Problem < ApplicationRecord
  PER_PAGE = 12
  paginates_per PER_PAGE
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :solutions, dependent: :destroy
end
