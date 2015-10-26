class Add < ActiveRecord::Migration
  def change
    add_column :user_comments, :commenter_id, :integer, index: true
    add_column :goal_comments, :commenter_id, :integer, index: true
  end
end
