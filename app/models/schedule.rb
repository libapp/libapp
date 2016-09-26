class Schedule < ActiveRecord::Base
  after_initialize :set_defaults
  belongs_to :member
  belongs_to :room

  def set_defaults
    self.status  ||= 0
  end
end
