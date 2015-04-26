require 'rails_helper'

feature 'a league owner approves a membership request', %q(

  As a league owner
  I want to approve a membership request
  So the requestor can join the league

  [ ] I must see a list of all membership requests
  [ ] Upon accepting their request, I see a notification indicating sucess.

) do

  scenario 'user approves a request' do
    league = FactoryGirl.create(:league)
    request = FactoryGirl.create(:membership_request, league: league)

    sign_in_as(league.user)

    visit league_path(league)

    expect(page).to have_content(request.user.username)
    click_link 'Approve Request'

    expect(page).to have_content('You have approved the membership request.')
  end

end
