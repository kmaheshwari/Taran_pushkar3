class MemberEvent < ActiveRecord::Base
  attr_accessible :event_id, :member_id
  belongs_to :member  
  belongs_to :event
end
