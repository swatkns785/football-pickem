class LeaguePicksController < ApplicationController

  def new
    @league_week = LeagueWeek.find(params[:league_week_id])
    @league_games = LeagueGame.where(league_week_id: params[:league_week_id])
    @league_picks = LeaguePick.new
  end

  def create

  end

end
