class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  PER_PAGE = 24
  paginates_per PER_PAGE

  has_many :problems, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :solutions, dependent: :destroy
  has_many :views, dependent: :destroy

  validates :username, presence: true, uniqueness: true

  def to_param
    username
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    User.where(email: data.email).first || User.create(
      username: data.name,
      email: data.email,
      password: Devise.friendly_token
    )
  end
end
