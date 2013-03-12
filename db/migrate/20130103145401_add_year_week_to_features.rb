class AddYearWeekToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :year_week, :string, :null => false
  end
end
