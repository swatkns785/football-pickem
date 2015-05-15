class LeaguePicksController < ApplicationController
  def new
    @league_week = LeagueWeek.find(params[:league_week_id])
    @league_games = LeagueGame.where(league_week_id: params[:league_week_id])
    @league_picks = LeaguePick.new
  end

  def create
    league_week = LeagueWeek.find(params[:league_week_id])
    params["league_game"].each do |id, team|
      pick = LeaguePick.find_or_initialize_by(
        entry: team,
        league_week_id: params[:league_week_id],
        league_game_id: id,
        user: current_user)
      pick.save!
    end
    league = League.find_by(id: league_week.league_id)
    flash[:notice] = "Week #{params[:league_week_id]} picks submitted successfully."
    redirect_to league_path(league)
  end
3end
