class Problem < ApplicationRecord
  PER_PAGE = 12
  paginates_per PER_PAGE

  validates :title, presence: true
  validates :description, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy
end
