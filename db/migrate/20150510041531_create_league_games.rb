class CreateLeagueGames < ActiveRecord::Migration
  def change
    create_table :league_games do |t|
      t.integer :league_id, null: false
      t.integer :league_week_id, null: false
      t.integer :week_id, null: false
      t.string :day, null: false
      t.string :date, null: false
      t.string :visitor_team, null: false
      t.string :home_team, null: false
      t.string :time, null: false

      t.timestamps null: false
    end
  end
end
