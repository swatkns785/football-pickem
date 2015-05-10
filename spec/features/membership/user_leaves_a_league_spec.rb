require 'rails_helper'

feature 'user leaves a league', %q(

  As a league member
  I want to delete my league membership
  So that I no longer participate in the league

) do

  scenario 'user successfully leaves league' do
    league = FactoryGirl.create(:league)
    membership = FactoryGirl.create(:membership, league: league)

    sign_in_as(membership.user)
    visit league_path(league)

    click_link "Leave League"
    expect(page).to have_content("You have successfully left #{league.title}.")
  end
end
