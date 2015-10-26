def GoalComment < ActiveRecord::Base
  validates :comment, :goal_id, presence: true
  belongs_to :goal

end
