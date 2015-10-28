class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :item_id
      t.string :item_type
      t.integer :commenter_Id

      t.timestamps
    end
    drop_table :goal_comments
    drop_table :user_comments
  end
end
