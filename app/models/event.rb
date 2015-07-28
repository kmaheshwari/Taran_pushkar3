class Event < ActiveRecord::Base
  attr_accessible :event_name
  has_many :member_events, :dependent => :destroy
  has_many :members, :through => :member_events
end
