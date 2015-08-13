class RaceTimingIndEvnt < ActiveRecord::Base
  attr_accessible :micro_second, :minute, :second ,:age, :e_type
  has_many :events
  
  attr_accessor :age , :e_type

end
