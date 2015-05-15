class MembershipRequestsController < ApplicationController
  def create
    @league = League.find_by(id: params[:league_id])
    @request = MembershipRequest.new(lmr_params)
    @request.user = current_user
    @request.league = @league
    if @request.save
      flash[:notice] = 'Request to join league sent.'
      redirect_to league_path(@league)
    else
      redirect_to league_path(@league)
    end
  end

  private
  def lmr_params
    params.permit(:user_id, :league_id)
  end
end
