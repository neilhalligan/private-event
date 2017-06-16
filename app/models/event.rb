class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances
  has_many :attendees, through: :attendances,
                       dependent: :destroy
  scope :past, -> { where("date < ?", Date.today) }
  scope :future, -> { where("date >= ?", Date.today) }
end
