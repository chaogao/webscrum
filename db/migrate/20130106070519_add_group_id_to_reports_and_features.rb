class AddGroupIdToReportsAndFeatures < ActiveRecord::Migration
  def change
    add_column :features, :group_id, :integer
    add_column :reports, :group_id, :integer    
  end
end
