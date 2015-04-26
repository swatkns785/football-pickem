class CreateLeagueMembershipRequests < ActiveRecord::Migration
  def change
    create_table :membership_requests do |t|
      t.integer :league_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
