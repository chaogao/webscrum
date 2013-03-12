class AddFtypesidToFeatures < ActiveRecord::Migration
  def change
  	add_column :features, :ftype_id, :integer, :null => false
  end
end
