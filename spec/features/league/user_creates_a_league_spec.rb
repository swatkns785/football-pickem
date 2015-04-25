require 'rails_helper'

feature 'a user creates a league', %Q{

  As a user
  I want to create a pickem league
  So that I can pick weekly football games with my friends

  Acceptance Criteria
  [ ] I must be presented with errors if form is filled out incorrectly
  [ ] I must provide a title for the league
  [ ] I must have the option to provide short description

} do

  scenario "successfully creates league" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    click_link "New League"
    expect(page).to have_content("Fill out the form to create a new Pick 'Em League")

    fill_in "Title", with: "Best League Ever"
    fill_in "Description", with: "This is the best league ever!"
    click_button "Create League"

    expect(page).to have_content('Your league has been successfully created.')
  end

end
