class MemberEvent < ActiveRecord::Base
  attr_accessible :event_id, :member_id
  belongs_to :member
  belongs_to :event
  accepts_nested_attributes_for :event,
    :reject_if => :all_blank

  #checks uniqueness of combination of user_id and member_id
  validates_uniqueness_of :member_id, :scope => :event_id
end
