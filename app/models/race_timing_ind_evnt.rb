class RaceTimingIndEvnt < ActiveRecord::Base
  attr_accessible :micro_second, :minute, :second,:time ,:age, :e_type, :member_id, :event_id , :age_group
  has_many :events, dependent: :destroy
  
  attr_accessor :age , :e_type

  def time
    # returns "12:14:24" as a string
    [minute, second, micro_second].join(":")
  end

  def time=(val)
    #split the val into an array ["11", "04", "123"] if it was 11:04:123
    val = val.split(":") 
    self.minute = val[0]
    self.second = val[1]
    self.micro_second = val[2]
   end
	  

end
