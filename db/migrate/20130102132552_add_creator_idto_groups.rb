class AddCreatorIdtoGroups < ActiveRecord::Migration
  def up
  	add_column :groups, :creator_id, :integer, :null => false
  end

  def down
  end
end
