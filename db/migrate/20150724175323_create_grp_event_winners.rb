class CreateGrpEventWinners < ActiveRecord::Migration
  def change
    create_table :grp_event_winners do |t|
      t.integer :gpoints

      t.timestamps
    end
  end
end
