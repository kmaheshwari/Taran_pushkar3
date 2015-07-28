class Member < ActiveRecord::Base
	belongs_to :competition_levels
	has_many :member_events, :dependent => :destroy
	has_many :events, :through => :member_events
end
