class Member < ActiveRecord::Base
	belongs_to :competition_levels
	has_many :member_events, :dependent => :destroy
	has_many :events, :through => :member_events
	has_many :member_groups, :dependent => :destroy
	has_many :group_events, :through => :member_groups
end
