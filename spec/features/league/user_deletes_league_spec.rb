require 'rails_helper'

feature 'league owner deletes league', %q(

  As a league owner
  I want to delete my league
  So that it no longer exists

  Acceptance Criteria
  [ ] I must be given the option to delete a league on its show page.
  [ ] I must see a message telling me the league has been deleted.

) do

  scenario 'successfully delete a league' do
    league = FactoryGirl.create(:league)
    create_league(league)
    visit league_path(league)

    click_link "Delete League"
    expect(page).to have_content "Your league has been deleted."

    expect(page).to_not have_content(league.title)
  end

end
