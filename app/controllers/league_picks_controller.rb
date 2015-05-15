class LeaguePicksController < ApplicationController

  def new
    @league_week = LeagueWeek.find(params[:league_week_id])
    @league_games = LeagueGame.where(league_week_id: params[:league_week_id])
    @league_picks = LeaguePick.new
  end

  def create
    params_hash = params
    params_hash["league_game"].each do |id, team|
      pick = LeaguePick.new(entry: team, league_week_id: params[:league_week_id], league_game_id: id)
  binding.pry
      if pick.save
        league_week = League.find_by(league_week_id: params[:league_week_id])
        flash[:notice] = "Picks successfully submitted for #{params[:league_week_id]}"
        redirect_to league_week_path(league_week)
      end
    end
  end

end
