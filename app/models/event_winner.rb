class EventWinner < ActiveRecord::Base
  attr_accessible :points
  belongs_to :event

  attr_accessor :event_id

end
