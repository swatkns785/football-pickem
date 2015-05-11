class LeaguePick < ActiveRecord::Base
  belongs_to :league_week
  belongs_to :league_game
  belongs_to :membership

  validates :membership_id,
    presence: true,
    numericality: { only_integer: true }

  validates :league_week_id,
    presence: true,
    numericality: { only_integer: true }

  validates :league_game_id,
    presence: true,
    numericality: { only_integer: true }

  validates :entry,
    presence: true
end
