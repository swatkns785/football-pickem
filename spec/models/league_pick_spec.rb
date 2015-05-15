require 'rails_helper'

RSpec.describe LeaguePick, type: :model do
  it { should belong_to(:league_week) }
  it { should belong_to(:league_game) }
  it { should belong_to(:user) }

  it { should have_valid(:league_week_id).when(1, 25, 50) }
  it { should_not have_valid(:league_week_id).when(nil, '', 12.4) }

  it { should have_valid(:league_game_id).when(1, 25, 50) }
  it { should_not have_valid(:league_game_id).when(nil, '', 5.6) }

  it { should have_valid(:user_id).when(1, 25, 50) }
  it { should_not have_valid(:user_id).when(nil, '', 16.8) }

  it { should have_valid(:entry).when("New England Patriots", "Seattle Seahawks") }
  it { should_not have_valid(:entry).when(nil, '', 'Boston Red Sox') }
end
