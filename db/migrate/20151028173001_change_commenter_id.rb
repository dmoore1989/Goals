class ChangeCommenterId < ActiveRecord::Migration
  def change
    rename_column :comments, :commenter_id, :commenter_id

  end
end
