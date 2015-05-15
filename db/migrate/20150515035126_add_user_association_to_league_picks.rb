class AddUserAssociationToLeaguePicks < ActiveRecord::Migration
  def change
    add_column :league_picks, :user_id, :integer, null: false
  end
end
