require 'rails_helper'

feature 'a user views a league', %q{
  As a user
  I want to view a league
  So I can view it's information

  [ ] I must be able to access the league from the index
  [ ] I must see the league's title and description
  [ ] I must see the league's creator
} do

  scenario "view single league" do
    league = FactoryGirl.create(:league)
    create_league(league)

    visit root_path
    click_link league.title

    expect(page).to have_content(league.title)
    expect(page).to have_content(league.description)
    expect(page).to have_content(league.user.name)
  end

end
