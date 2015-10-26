def UserComment < ActiveRecord::Base
  validates :comment, :user_id, presence: true
  belongs_to :user

end
