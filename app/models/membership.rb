class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :league
  has_many :league_picks

  validates :league,
    presence: true

  validates :user,
    presence: true,
    uniqueness: { scope: :league_id }

  validates_inclusion_of :owner,
    in: [true, false]
end
