require 'rails_helper'

RSpec.describe LeagueGame, type: :model do
  it { should belong_to(:league_week) }
  it { should belong_to(:league) }
  it { should have_many(:league_picks) }
  it { should belong_to(:game) }

  it { should have_valid(:league_id).when(1, 2, 17) }
  it { should_not have_valid(:league_id).when("blah", 25.8, nil) }

  it { should have_valid(:day).when("Sunday", "Monday", "Thursday") }
  it { should_not have_valid(:day).when('', nil) }

  it { should have_valid(:date)
    .when("September 3", "November 4", "December 28") }
  it { should_not have_valid(:date).when('', nil) }

  it { should have_valid(:visitor_team)
    .when("New England Patriots", "Atlanta Falcons") }
  it { should_not have_valid(:visitor_team).when('', nil) }

  it { should have_valid(:home_team)
    .when("New England Patriots", "Atlanta Falcons") }
  it { should_not have_valid(:home_team).when('', nil) }

  it { should have_valid(:time).when("8:30 PM", "1:00 PM") }
  it { should_not have_valid(:time).when('', nil) }
end
