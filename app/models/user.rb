class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PER_PAGE = 24
  paginates_per PER_PAGE

  has_many :problems, dependent: :destroy
  has_many :comments, dependent: :destroy
end
