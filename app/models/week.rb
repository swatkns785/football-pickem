class Week < ActiveRecord::Base
  has_many :league_weeks

  validates :week_number,
    presence: true,
    numericality: { only_integer: true }
end
