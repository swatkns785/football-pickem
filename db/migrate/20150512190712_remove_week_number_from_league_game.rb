class RemoveWeekNumberFromLeagueGame < ActiveRecord::Migration
  def change
    remove_column :league_games, :week_id, :integer, null: false
  end
end
