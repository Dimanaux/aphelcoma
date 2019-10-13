class Problem < ApplicationRecord
  PER_PAGE = 12
  belongs_to :user
  paginates_per PER_PAGE
  default_scope { order(created_at: :desc) }
end
