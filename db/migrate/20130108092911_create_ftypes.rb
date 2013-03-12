class CreateFtypes < ActiveRecord::Migration
  def change
    create_table :ftypes do |t|
      t.string :name, :null => false
      t.integer :catalog, :default => 0
      t.integer :owner
      t.integer :show, :default => 0
      t.text :description
      t.text :ruler

      t.timestamps
    end
  end
end
