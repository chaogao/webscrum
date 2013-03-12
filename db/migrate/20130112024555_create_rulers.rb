class CreateRulers < ActiveRecord::Migration
  def change
    create_table :rulers do |t|
      t.string :title, :null => false
      t.string :name, :null => false
      t.string :default

      t.timestamps
    end
  end
end
