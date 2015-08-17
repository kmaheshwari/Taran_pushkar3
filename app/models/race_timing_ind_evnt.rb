class RaceTimingIndEvnt < ActiveRecord::Base
  attr_accessible :micro_second, :minute, :second ,:age, :e_type, :member_id, :event_id , :age_group
  has_many :events, dependent: :destroy
  
  attr_accessor :age , :e_type

#time feild only contain integers
  #validates :minute,:second , :micro_second, :numericality => {:only_integer => true}
  

end
