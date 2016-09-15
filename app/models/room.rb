class Room < ActiveRecord::Base
  self.primary_key = 'number'
  has_many :schedules
  has_many :members, through: :schedules

  validates :number, presence: true, length: { maximum: 50 }
end
