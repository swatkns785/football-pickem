class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :week_number, null: false

      t.timestamps null: false
    end
  end
end
