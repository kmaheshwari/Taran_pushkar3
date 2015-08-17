class Member < ActiveRecord::Base
	belongs_to :competetion_level
	has_many :member_events, dependent: :destroy 
	has_many :events, :through => :member_events
	has_many :member_groups, dependent: :destroy 
	has_many :group_events, :through => :member_groups


	#for accessing event model attributes through forms
	accepts_nested_attributes_for :events,
           :reject_if => :all_blank,
           :allow_destroy => true
  	accepts_nested_attributes_for :member_events

#field not remain blank
  validates :name, :gender, :dob, :state , :age_group, :district , :schl_club_name,presence: true
#field must contain alphabets
  validates :name, :district , format: { with: /\A[a-zA-Z\s]+\z/,
    message: "only alphabets and spaces are allowed" }

#fields must choose a valid option	
	validates :state,:comp_name, :age_group , exclusion: { in: %w(Select),message: "Select a valid option" }
end




