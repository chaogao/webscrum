class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name, :null => false
      t.text :description
      t.integer :progress, :default => 0
      t.integer :plane_days, :null => false
      t.integer :use_days, :default => 0 
      t.integer :user_id, :null => false
      t.timestamps
    end
  end
end
