class ChangeDescriptionFromReportsFeatures < ActiveRecord::Migration
  def up
  	change_column :reports_features, :description, :string, :limit => 255
  end

  def down
  end
end
