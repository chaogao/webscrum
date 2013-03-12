class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title, :null => false
      t.text :content
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
