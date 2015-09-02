class AddHit < ActiveRecord::Migration
  def up
  	add_column :race_timing_ind_evnts, :event_type, :string, :default => "Trial"
  	add_column :race_timing_grp_evnts, :event_type, :string, :default => "Trial"
  	
  end

  def down
  end
end
