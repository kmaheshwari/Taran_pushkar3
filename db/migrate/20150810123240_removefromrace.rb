class Removefromrace < ActiveRecord::Migration
  def up
  	add_column :race_timing_ind_evnts, :member_event_id, :integer
  	add_foreign_key(:race_timing_ind_evnts, :member_events)

  	remove_foreign_key(:race_timing_ind_evnts, :members)
      remove_foreign_key(:race_timing_ind_evnts, :events)
      remove_foreign_key(:race_timing_ind_evnts, :competetion_levels)
  	remove_column :race_timing_ind_evnts, :member_id
  	remove_column :race_timing_ind_evnts, :event_id
  	remove_column :race_timing_ind_evnts, :competetion_level_id
  end

  def down
  end
end
