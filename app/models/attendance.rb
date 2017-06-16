class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :event
  scope :activated, -> { where(activated: true) }
  scope :unactivated, -> { where(activated: [false, nil]) }

  # def self.activated
  #   where(activated == true)
  # end
end
