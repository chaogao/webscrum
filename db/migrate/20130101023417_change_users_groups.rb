class ChangeUsersGroups < ActiveRecord::Migration
  def up
  	change_column :users_groups, :auth, :integer, :default => 0
  	change_column :users_groups, :user_id, :integer, :null => false
  	change_column :users_groups, :group_id, :integer, :null => false
  end

  def down
  end
end
