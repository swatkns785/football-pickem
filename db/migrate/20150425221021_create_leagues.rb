class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :title, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
