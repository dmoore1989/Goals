class Comment < ActiveRecord::Base
  validates :comment, :item_id, :item_type, :commenter_id, presence: true

end
