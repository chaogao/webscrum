class AddStartEndToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :start, :date
    add_column :features, :end, :date
  end
end
