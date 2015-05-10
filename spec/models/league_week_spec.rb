require 'rails_helper'

RSpec.describe LeagueWeek, type: :model do
  it { should belong_to :league }
  it { should belong_to :week }

  it { should have_valid(:week_id).when(1, 17) }
  it { should_not have_valid(:week_id).when("word", 5.5, nil) }

  it { should have_valid(:league_id).when(1, 17) }
  it { should_not have_valid(:league_id).when("word", 5.5, nil) }
end
