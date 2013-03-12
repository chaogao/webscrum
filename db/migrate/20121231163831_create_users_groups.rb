class CreateUsersGroups < ActiveRecord::Migration
  def change
    create_table :users_groups do |t|
      t.integer :user_id
      t.integer :group_id
      t.integer :auth
      t.datetime :join_time

      t.timestamps
    end
  end
end
