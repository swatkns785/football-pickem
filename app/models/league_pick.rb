class LeaguePick < ActiveRecord::Base
  belongs_to :league_week
  belongs_to :league_game
  belongs_to :user

  validates :user_id,
    presence: true,
    numericality: { only_integer: true }

  validates :league_week_id,
    presence: true,
    numericality: { only_integer: true }

  validates :league_game_id,
    presence: true,
    uniqueness: true,
    numericality: { only_integer: true }

  validates :entry,
    presence: true,
    inclusion: { in: ["Arizona Cardinals",
                      "Atlanta Falcons",
                      "Baltimore Ravens",
                      "Buffalo Bills",
                      "Carolina Panthers",
                      "Chicago Bears",
                      "Cincinnati Bengals",
                      "Cleveland Browns",
                      "Dallas Cowboys",
                      "Denver Broncos",
                      "Detroit Lions",
                      "Green Bay Packers",
                      "Houston Texans",
                      "Indianapolis Colts",
                      "Jacksonville Jaguars",
                      "Kansas City Chiefs",
                      "Miami Dolphins",
                      "Minnesota Vikings",
                      "New England Patriots",
                      "New Orleans Saints",
                      "New York Giants",
                      "New York Jets",
                      "Oakland Raiders",
                      "Philadelphia Eagles",
                      "Pittsburgh Steelers",
                      "San Diego Chargers",
                      "San Francisco 49ers",
                      "Seattle Seahawks",
                      "St. Louis Rams",
                      "Tampa Bay Buccaneers",
                      "Tennessee Titans",
                      "Washington Redskins"]}

end
