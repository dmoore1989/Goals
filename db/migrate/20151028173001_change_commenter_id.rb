class ChangeCommenterId < ActiveRecord::Migration
  def change
    rename_column :comments, :commenter_Id, :commenter_id

  end
end
