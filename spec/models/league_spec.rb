require 'rails_helper'

RSpec.describe League, type: :model do

  it { should have_valid(:title).when('Best League', 'League 1234') }
  it { should_not have_valid(:title).when(nil, '') }

  it "requires a unique title" do
    league = FactoryGirl.create(:league)
    other_league = FactoryGirl.create(:league)
    other_league.title = league.title
    expect(other_league).to_not be_valid
    expect(other_league.errors).to_not be_blank
  end

end
