class CreateReportsFeatures < ActiveRecord::Migration
  def change
    create_table :reports_features do |t|
      t.integer :feature_id, :null => false
      t.integer :report_id, :null => false
      t.string :description
      t.integer :progress_increment, :default => 0

      t.timestamps
    end
  end
end
