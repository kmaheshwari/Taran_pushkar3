class Event < ActiveRecord::Base
  attr_accessible :event_name
  has_many :member_events
  has_many :members, :through => :member_events
  has_many :event_winner
end
