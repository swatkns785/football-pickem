require 'rails_helper'

RSpec.describe Membership, type: :model do
  it { should belong_to :user }
  it { should belong_to :league }

  it { should have_valid(:league).when(League.new) }
  it { should_not have_valid(:league).when(nil) }

  it { should have_valid(:user).when(User.new) }
  it { should_not have_valid(:user).when(nil) }

  it 'requires a unique user_id and league_id' do
    membership = FactoryGirl.create(:membership, owner: false)
    other_membership = FactoryGirl.build(:membership,
      league: membership.league,
      user: membership.user,
      owner: false)
    expect(other_membership).to_not be_valid
    expect(other_membership.errors[:user]).to_not be_blank
  end
end
