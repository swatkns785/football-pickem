require 'rails_helper'

RSpec.describe MembershipRequest, type: :model do
  it { should belong_to :user }
  it { should belong_to :league }

  it { should have_valid(:league).when(League.new) }
  it { should_not have_valid(:league).when(nil) }

  it { should have_valid(:user).when(User.new) }
  it { should_not have_valid(:user).when(nil) }

  it 'requires a unique user_id and league_id' do
    request = FactoryGirl.create(:membership_request)
    other_request = FactoryGirl.build(:membership_request,
      league: request.league,
      user: request.user)
    expect(other_request).to_not be_valid
    expect(other_request.errors[:user]).to_not be_blank
  end
end
