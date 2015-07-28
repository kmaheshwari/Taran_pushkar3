class MemberGroup < ActiveRecord::Base
  attr_accessible :group_event_id, :member_id
  belongs_to :member  
  belongs_to :group_event
end
