class Create < ActiveRecord::Migration
  def change

    create_table :user_comments do |t|
      t.text :comment, null: false
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end

    create_table :goal_comments do |t|
      t.text :comment, null: false
      t.integer :goal_id, null: false, index: true

      t.timestamps null: false
    end


  end
end
