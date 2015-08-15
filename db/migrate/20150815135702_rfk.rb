class Rfk < ActiveRecord::Migration
  def up
  	remove_foreign_key(:race_timing_ind_evnts, :members)
  	remove_foreign_key(:race_timing_ind_evnts, :events)
  end

  def down
  end
end
