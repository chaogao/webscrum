class ChangeCreatedDateToReports < ActiveRecord::Migration
  def up
    rename_column :reports, :create_date, :created_date
  end

  def down
  end
end
