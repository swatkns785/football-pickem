class CreateLeagueWeeks < ActiveRecord::Migration
  def change
    create_table :league_weeks do |t|
      t.integer :week_id, null: false
      t.integer :league_id, null: false

      t.timestamps null: false
    end
  end
end
