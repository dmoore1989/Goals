class ChangeItemColumns < ActiveRecord::Migration
  def change
    rename_column :comments, :item_id, :commentable_id
    rename_column :comments, :item_type, :commentable_type
  end
end
