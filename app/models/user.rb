class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :leagues
  has_many :membership_requests
  has_many :memberships

  validates :first_name,
    presence: true

  validates :last_name,
    presence: true

  validates :username,
    presence: true,
    uniqueness: true

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :sign_up }

  validates :password,
    presence: true

  validates :password_confirmation,
    presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
