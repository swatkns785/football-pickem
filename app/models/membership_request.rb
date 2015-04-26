class MembershipRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :league

  validates :user,
    presence: true,
    uniqueness: { scope: :league_id }

  validates :league,
    presence: true
end
