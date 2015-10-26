class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.boolean :private, null: false
      t.boolean :completed, null: false, default: false

      t.timestamps null: false
    end
    add_index :users, :session_token
  end
end
