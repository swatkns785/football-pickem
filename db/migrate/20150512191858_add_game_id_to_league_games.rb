class AddGameIdToLeagueGames < ActiveRecord::Migration
  def change
    add_column :league_games, :game_id, :integer, null: false
  end
end
