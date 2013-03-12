class AddFtypeIdToRuler < ActiveRecord::Migration
  def change
  	add_column :rulers, :ftype_id, :integer, :null => false
  end
end
