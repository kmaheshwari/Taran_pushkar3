class RaceTimingGrpEvnt < ActiveRecord::Base
  attr_accessible :gmicro_second, :gminute, :gsecond , :gtime, :gage , :gevnt , :ge_type, :mem,
   :member_id, :group_event_id,:competetion_level_id, :age_group
  has_many :group_events, dependent: :destroy
  attr_reader :gage , :gevnt , :ge_type, :gtime

  #less than 60 in gminute,gsecond,gmicro_second
  validates_inclusion_of :gminute, :in => 0..60, :message => "can only be between 0 and 60." , :on => :create
  validates_inclusion_of :gsecond, :in => 0..60, :message => "can only be between 0 and 60." , :on => :create
  validates_inclusion_of :gmicro_second, :in => 0..60, :message => "can only be between 0 and 60." , :on => :create
  
  def gtime
    # returns "12:14:24" as a string
    [gminute, gsecond, gmicro_second].join(".")
  end

  def gtime=(val)
    #split the val into an array ["11", "04", "123"] if it was 11:04:123
    val = val.split(".") 
    self.gminute = val[0]
    self.gsecond = val[1]
    self.gmicro_second = val[2]
   end
end
