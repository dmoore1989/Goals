class Goal < ActiveRecord::Base
  validates :name, :description, :user, presence: true
  validates :private, :completed, inclusion: { in: [true, false]}

  belongs_to :user

end
