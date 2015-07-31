class GrpEventWinner < ActiveRecord::Base
  attr_accessible :gpoints
  belongs_to :group_event
end
