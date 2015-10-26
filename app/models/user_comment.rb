class UserComment < ActiveRecord::Base
  validates :comment, :user_id, :commenter_id, presence: true
  belongs_to :user
  belongs_to :commenter, class_name: 'User', foreign_key: :commenter_id
end
