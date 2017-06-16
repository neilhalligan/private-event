class User < ApplicationRecord
  has_many :hosted_events, foreign_key: 'creator_id',
                           class_name: 'Event',
                           dependent: :destroy
  has_many :attendances, foreign_key: 'attendee_id',
                         dependent: :destroy
  has_many :attended_events, through: :attendances,
                             source: :event,
                             dependent: :destroy
end
