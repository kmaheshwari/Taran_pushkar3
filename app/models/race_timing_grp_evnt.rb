class RaceTimingGrpEvnt < ActiveRecord::Base
  attr_accessible :gmicro_second, :gminute, :gsecond , :gage , :gevnt , :ge_type
  has_many :group_events, dependent: :destroy
  attr_reader :gage , :gevnt , :ge_type
end
