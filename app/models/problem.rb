class Problem < ApplicationRecord
  PER_PAGE = 12
  paginates_per PER_PAGE

  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  has_many :comments, dependent: :destroy
  has_many :solutions, dependent: :destroy
  has_many :views, dependent: :destroy
end
