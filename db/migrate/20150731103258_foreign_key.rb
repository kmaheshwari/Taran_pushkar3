class ForeignKey < ActiveRecord::Migration
  def up
  	  add_column :competetion_levels, :member_id, :integer
 	  add_foreign_key(:competetion_levels, :members)

 	  add_column :race_timing_ind_evnts, :member_id, :integer 	 
  	  add_column :race_timing_ind_evnts, :event_id, :integer
  	  add_column :race_timing_ind_evnts, :competetion_level_id, :integer 	 
  	  add_foreign_key(:race_timing_ind_evnts, :members)
      add_foreign_key(:race_timing_ind_evnts, :events)
      add_foreign_key(:race_timing_ind_evnts, :competetion_levels)

      add_column :race_timing_grp_evnts, :member_id, :integer 	 
  	  add_column :race_timing_grp_evnts, :group_event_id, :integer
  	  add_column :race_timing_grp_evnts, :competetion_level_id, :integer 	 
  	  add_foreign_key(:race_timing_grp_evnts, :members)
      add_foreign_key(:race_timing_grp_evnts, :group_events)
      add_foreign_key(:race_timing_grp_evnts, :competetion_levels) 

      add_column :event_winners, :member_id, :integer
      add_column :event_winners, :event_id, :integer
      add_foreign_key(:event_winners, :members)
      add_foreign_key(:event_winners, :events)

      add_column :grp_event_winners, :member_id, :integer
      add_column :grp_event_winners, :group_event_id, :integer
      add_foreign_key(:grp_event_winners, :members)
      add_foreign_key(:grp_event_winners, :group_events)

      add_column :member_events, :member_id, :integer
      add_column :member_events, :event_id, :integer
      add_foreign_key(:member_events, :members)
      add_foreign_key(:member_events, :events)

      add_column :member_groups, :member_id, :integer
      add_column :member_groups, :group_event_id, :integer
      add_foreign_key(:member_groups, :members)
      add_foreign_key(:member_groups, :group_events)

  end

  def down
  end
end
