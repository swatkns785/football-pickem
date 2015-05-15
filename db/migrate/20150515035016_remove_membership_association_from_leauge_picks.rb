class RemoveMembershipAssociationFromLeaugePicks < ActiveRecord::Migration
  def change
    remove_column :league_picks, :membership_id, :integer, null: false
  end
end
