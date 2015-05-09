require 'rails_helper'

RSpec.describe Week, type: :model do
  it { should have_many :league_weeks }

  it { should have_valid(:week_number).when(1, 2, 3) }
  it { should_not have_valid(:week_number).when("", 3.5) }
end
