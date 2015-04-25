class LeaguesController < ApplicationController
  def show
    @league = League.find(params[:id])
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    @league.user = current_user

    if @league.save
      redirect_to league_path(@league)
      flash[:notice] = "Your league has been successfully created."
    else
      render :new
    end
  end

  private

  def league_params
    params.require(:league).permit(:title, :description)
  end
end
