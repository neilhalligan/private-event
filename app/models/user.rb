class User < ApplicationRecord
  has_many :hosted_events, foreign_key: 'creator_id', class_name: 'Event', :source
end
