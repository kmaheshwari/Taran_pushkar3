class EventWinner < ActiveRecord::Base
  attr_accessible :points
  belongs_to :event
end
