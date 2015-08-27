class EventWinner < ActiveRecord::Base
  attr_accessible :member_id,:points
  

  attr_accessor :event_id

end
