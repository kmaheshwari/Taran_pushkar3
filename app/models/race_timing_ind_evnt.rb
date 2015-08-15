class RaceTimingIndEvnt < ActiveRecord::Base
  attr_accessible :micro_second, :minute, :second ,:age, :e_type, :member_id, :event_id , :age_group
  has_many :events
  
  attr_accessor :age , :e_type
end
