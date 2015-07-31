class CreateRaceTimingGrpEvnts < ActiveRecord::Migration
  def change
    create_table :race_timing_grp_evnts do |t|
      t.integer :gminute
      t.integer :gsecond
      t.integer :gmicro_second
      
      t.timestamps
    end
  end
end
