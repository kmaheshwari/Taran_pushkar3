class RemCompId < ActiveRecord::Migration
  def up
  	remove_foreign_key(:race_timing_grp_evnts, :competetion_levels)
	remove_column :race_timing_grp_evnts, :competetion_level_id

	add_column :race_timing_grp_evnts, :age_group, :string
  end

  def down
  end
end
