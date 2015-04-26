require 'rails_helper'

feature 'a user requests to join a league', %q(

  As a registered user
  I want to request access to join a league
  So that I can pick games in said league

  Acceptance Criteria
  [ ] I must be able to request to join a league from show page
  [ ] I must be notified when I've submitted my request successfully

) do

  scenario 'user successfully requests to join a league' do
    league = FactoryGirl.create(:league)
    create_league(league)

    click_link 'Sign Out'

    requestor = FactoryGirl.create(:user)
    sign_in_as(requestor)

    visit league_path(league)
    click_link 'Join League'

    expect(page).to have_content('Request to join league sent.')
  end

end
