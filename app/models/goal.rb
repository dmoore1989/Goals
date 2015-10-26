class Goal < ActiveRecord::Base
  validates :name, :description, :private, :completed, :user, presence: true

  belongs_to :user, inverse_of: :goal

end
