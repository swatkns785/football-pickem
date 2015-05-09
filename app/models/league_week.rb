class LeagueWeek < ActiveRecord::Base
  belongs_to :league
  belongs_to :week
  
  validates :week_id,
    presence: true,
    numericality: { only_integer: true }

  validates :league_id,
    presence: true,
    numericality: { only_integer: true }
end
