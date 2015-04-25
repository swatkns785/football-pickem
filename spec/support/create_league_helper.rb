def create_league(league)
  sign_in_as(league.user)
  visit new_league_path
  fill_in "Title", with: league.title
  fill_in "Description", with: league.description
  click_button "Create League"
end
