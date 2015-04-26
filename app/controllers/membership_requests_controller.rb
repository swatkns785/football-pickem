class MembershipRequestsController < ApplicationController

  def create
    @league = League.find_by(id: params[:league_id])

    @request = MembershipRequest.new
    @request.user_id = current_user.id
    @request.league_id = @league.id
    if @request.save
      flash[:notice] = 'Request to join league sent.'
      redirect_to league_path(@league)
    else
      redirect_to league_path(@league)
    end
  end

  private

  def lmr_params
    params.require(:league_membership_request).permit(:user_id, :league_id)
  end

end
