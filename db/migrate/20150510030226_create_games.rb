class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
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
