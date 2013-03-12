class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :contact
      t.string :head_img
      t.text :description

      t.timestamps
    end
  end
end
