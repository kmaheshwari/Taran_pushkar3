class RaceTimingIndEvnt < ActiveRecord::Base
  attr_accessible :micro_second, :minute, :second
  has_many :events
  attr_reader :age , :evnt , :e_type
end
