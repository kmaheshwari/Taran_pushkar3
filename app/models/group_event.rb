class GroupEvent < ActiveRecord::Base
  attr_accessible :grp_event_name, :grp_event_type
  has_many :member_groups, :dependent => :destroy
  has_many :members, :through => :member_groups
end
