class RaceTimingIndEvnt < ActiveRecord::Base
  attr_accessible :micro_second, :minute, :second
  has_many :events
end
