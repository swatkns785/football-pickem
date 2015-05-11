class LeagueWeek < ActiveRecord::Base
  belongs_to :league
  belongs_to :week
  has_many :league_games
  has_many :league_picks

  validates :week_id,
    presence: true,
    numericality: { only_integer: true }

  validates :league_id,
    presence: true,
    numericality: { only_integer: true }
end
