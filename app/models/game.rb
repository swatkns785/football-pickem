class Game < ActiveRecord::Base
  belongs_to :week
  has_many :league_games

  validates :week_id,
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
