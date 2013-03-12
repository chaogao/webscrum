class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :auth
      t.string :email
      t.string :head_img
      t.text :description

      t.timestamps
    end
  end
end
