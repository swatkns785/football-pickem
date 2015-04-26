class League < ActiveRecord::Base
  belongs_to :user
  has_many :membership_requests

  validates :title,
    presence: true,
    uniqueness: true
end
