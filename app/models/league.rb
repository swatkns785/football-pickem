class League < ActiveRecord::Base
  belongs_to :user
  has_many :membership_requests
  has_many :memberships

  validates :title,
    presence: true,
    uniqueness: true
end
