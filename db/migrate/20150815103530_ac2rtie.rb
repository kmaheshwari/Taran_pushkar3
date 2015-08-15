class Ac2rtie < ActiveRecord::Migration
  def up
  	add_column :race_timing_ind_evnts, :age_group, :string
  end

  def down
  end
end
