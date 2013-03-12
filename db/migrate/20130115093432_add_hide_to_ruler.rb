class AddHideToRuler < ActiveRecord::Migration
  def change
  	add_column :rulers, :hide, :bool, :default => false
  end
end
