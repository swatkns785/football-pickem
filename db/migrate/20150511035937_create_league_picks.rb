class CreateLeaguePicks < ActiveRecord::Migration
  def change
    create_table :league_picks do |t|
      t.integer :league_week_id, null: false
      t.integer :league_game_id, null: false
      t.integer :membership_id, null: false
      t.string :entry, null: false

      t.timestamps null: false
    end
  end
end
