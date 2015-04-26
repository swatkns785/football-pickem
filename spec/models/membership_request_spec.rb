require 'rails_helper'

RSpec.describe MembershipRequest, type: :model do

  it { should belong_to :user }
  it { should belong_to :league }

end
