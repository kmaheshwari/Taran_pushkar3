class CreateRaceTimingIndEvnts < ActiveRecord::Migration
  def change
    create_table :race_timing_ind_evnts do |t|
      t.integer :minute
      t.integer :second
      t.integer :micro_second
     
      t.timestamps
    end
  end
end
