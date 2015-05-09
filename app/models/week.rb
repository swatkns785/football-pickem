class Week < ActiveRecord::Base
  validates :week_number,
    presence: true,
    numericality: { only_integer: true }
end
