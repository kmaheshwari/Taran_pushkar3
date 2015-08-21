class RaceTimingGrpEvnt < ActiveRecord::Base
  attr_accessible :gmicro_second, :gminute, :gsecond , :gtime, :gage , :gevnt , :ge_type,
   :member_id, :group_event_id
  has_many :group_events, dependent: :destroy
  attr_reader :gage , :gevnt , :ge_type, :gtime

  def gtime
    # returns "12:14:24" as a string
    [gminute, gsecond, gmicro_second].join(":")
  end

  def gtime=(val)
    #split the val into an array ["11", "04", "123"] if it was 11:04:123
    val = val.split(":") 
    self.gminute = val[0]
    self.gsecond = val[1]
    self.gmicro_second = val[2]
   end
end
