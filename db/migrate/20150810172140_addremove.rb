class Addremove < ActiveRecord::Migration
  def up
  	
  	remove_foreign_key(:race_timing_ind_evnts, :member_events)
  	remove_column :race_timing_ind_evnts, :member_event_id

  	add_column :race_timing_ind_evnts, :member_id, :integer
  	add_column :race_timing_ind_evnts, :event_id, :integer
  	add_foreign_key(:race_timing_ind_evnts, :members)
    add_foreign_key(:race_timing_ind_evnts, :events)
      
  	
  	
  end

  def down
  end
end
