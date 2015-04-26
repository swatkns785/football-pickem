class AddRolesToMemmberships < ActiveRecord::Migration
  def change
    add_column :memberships, :owner, :boolean, default: false, null: false
  end
end
