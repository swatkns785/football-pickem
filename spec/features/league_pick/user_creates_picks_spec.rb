require 'rails_helper'

feature 'user creates picks', %q(
  As a league member
  I want to create my picks for a given week
  So I have picks recorded

  Acceptance Criteria
  [ ] I must be able to create picks through a league page
  [ ] I must be notified when I submit my picks
  [ ] I must be notified if there are errors with my submission
) do

  context 'as authenticated league member' do
    before(:each) do
      seed_test_database_with_league_weeks_and_league_games
    end

    scenario "I successfully create a week's picks", focus: true do
      league = FactoryGirl.create(:league)
      member = FactoryGirl.create(:membership, league: league)

      sign_in_as(member.user)
      visit league_path(league)
      click_link "Make Week #{league.league_weeks[0].week_id} Picks"

      expect(page).to have_content "Select one team per game below."

      choose('New England Patriots')
      click_button "Submit #{league.league_weeks[0].week_id} Picks"

      expect(page).to have_content "#{league.league_weeks[0].week_id} picks submitted successfully."
    end
  end

end
