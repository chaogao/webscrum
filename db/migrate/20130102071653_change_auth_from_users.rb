class ChangeAuthFromUsers < ActiveRecord::Migration
  def up
  	change_column :users, :auth, :integer, :default => 0
  	User.update_all :auth => 0
  end

  def down
  end
end
