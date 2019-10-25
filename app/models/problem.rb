class Problem < ApplicationRecord
  PER_PAGE = 12
  belongs_to :user
  paginates_per PER_PAGE

  has_many :views, dependent: :destroy
end
