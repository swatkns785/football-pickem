require 'rails_helper'

feature 'a user edits a league', %q(

  As a league owner
  I want to edit a league
  So that I can change the title and description

) do

  scenario 'successfully edit league', focus: true do
    league = FactoryGirl.create(:league)
    create_league(league)

    visit league_path(league)
    click_on 'Edit Your League'

    expect(page).to have_content("Fill out the form to edit your Pick 'Em League")
    fill_in "Title", with: 'A Different League'
    fill_in "Description", with: 'Awesome sauce.'
    click_button 'Update League'

    expect(page).to have_content('Your league has been successfully updated.')
    expect(page).to have_content('A Different League')
    expect(page).to have_content('Awesome sauce.')
  end

end
