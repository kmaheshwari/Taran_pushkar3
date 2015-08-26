class RemEventId < ActiveRecord::Migration
  def up
  	remove_foreign_key(:event_winners, :events)
  	remove_column :event_winners, :event_id
	remove_foreign_key(:grp_event_winners, :group_events)
	
	remove_column :grp_event_winners, :group_event_id
  end

  def down
  end
end
