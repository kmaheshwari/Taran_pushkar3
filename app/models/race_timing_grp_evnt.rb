class RaceTimingGrpEvnt < ActiveRecord::Base
  attr_accessible :gmicro_second, :gminute, :gsecond
  has_many :group_events
end
