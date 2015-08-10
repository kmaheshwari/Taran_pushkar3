class RaceTimingIndEvnt < ActiveRecord::Base
  attr_accessible :micro_second, :minute, :second ,:age
  has_many :events
  attr_reader :age , :evnt , :e_type
  attr_accessor :age ,:evnt
end
