class MembershipsController < ApplicationController

  def create
    @request = MembershipRequest.last
    @league = League.find_by(id: @request.league_id)
    @membership = Membership.new
    @membership.league_id = @request.league_id
    @membership.user_id = @request.user_id
    if @membership.save
      flash[:notice] = 'You have approved the membership request.'
      redirect_to league_path(@league)
    else
      flash[:alert] = "ERROR!"
      redirect_to league_path(@league)
    end
  end

end
