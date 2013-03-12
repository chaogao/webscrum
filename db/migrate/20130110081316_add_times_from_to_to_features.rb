class AddTimesFromToToFeatures < ActiveRecord::Migration
  def change
  	add_column :features, :times, :integer
  	add_column :features, :from, :integer
  	add_column :features, :to, :integer
  	add_column :features, :goal, :string
  end
end
