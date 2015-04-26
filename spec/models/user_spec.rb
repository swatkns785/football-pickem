require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many :leagues }
  it { should have_many :membership_requests }

  it { should have_valid(:first_name).when('Joe', 'Michael') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Sample', 'Mitchell') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:username).when('joesample1', 'mikey1234') }
  it { should_not have_valid(:username).when(nil, '') }

  it { should have_valid(:email).when('joesample@gmail.com',
    'someone@yahoo.com') }
  it { should_not have_valid(:email).when(nil, 'word', '.com', 'word@com',
    'word.com' )}

  it "requires a unique email" do
    user = FactoryGirl.create(:user)
    other_user = FactoryGirl.create(:user)
    other_user.email = user.email
    expect(other_user).to_not be_valid
    expect(other_user.errors).to_not be_blank
  end

  it "requires a unique username" do
    user = FactoryGirl.create(:user)
    other_user = FactoryGirl.create(:user)
    other_user.username = user.username
    expect(other_user).to_not be_valid
    expect(other_user.errors).to_not be_blank
  end

end
