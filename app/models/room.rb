class Room < ActiveRecord::Base
  after_initialize :set_defaults

  self.primary_key = 'number'
  has_many :schedules
  has_many :members, through: :schedules

  validates :number, presence: true, length: { maximum: 50 }

  def set_defaults
    self.status  ||= 0
  end
end
