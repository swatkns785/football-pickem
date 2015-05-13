class LeagueGame < ActiveRecord::Base
  belongs_to :league
  belongs_to :league_week
  belongs_to :game
  has_one :league_pick

  validates :league_id,
    presence: true,
    numericality: { only_integer: true }

  validates :league_week_id,
    presence: true,
    numericality: { only_integer: true }

  validates :day,
    presence: true

  validates :date,
    presence: true

  validates :visitor_team,
    presence: true

  validates :home_team,
    presence: true

  validates :time,
    presence: true
end
