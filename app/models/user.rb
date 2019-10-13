class User < ApplicationRecord
  PER_PAGE = 24
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  paginates_per PER_PAGE
  has_many :problems

  def to_param
    username
  end
end
