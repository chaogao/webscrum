class ChangeColumnToFtypes < ActiveRecord::Migration
  def up
  	    rename_column :ftypes, :owner, :user_id
  end

  def down
  end
end
