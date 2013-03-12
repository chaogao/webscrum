class AddCreateDateToReports < ActiveRecord::Migration
  def change
    add_column :reports, :create_date, :date, :null => false
  end
end
