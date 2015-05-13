class LeaguePicksController < ApplicationController

  def new
    @league_games = LeagueGame.where(league_week_id: params[:league_week_id])
  end

end
