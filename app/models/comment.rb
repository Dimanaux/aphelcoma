class Comment < ApplicationRecord
  validates :text, presence: true

  belongs_to :problem
  belongs_to :user
end
