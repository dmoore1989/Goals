class GoalComment < ActiveRecord::Base
  validates :comment, :goal_id, presence: true
  belongs_to :goal
  belongs_to :commenter, class_name: 'User', foreign_key: :commenter_id
end
