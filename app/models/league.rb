class League < ActiveRecord::Base
  belongs_to :user
  has_many :membership_requests
  has_many :memberships
  has_many :league_weeks

  validates :title,
    presence: true,
    uniqueness: true

  def is_league_member(user)
    memberships.find_by(user_id: user.id, league_id: params[:id])
  end
end
