class AddUserIdToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :user_id, :integer, null: false
  end
end
