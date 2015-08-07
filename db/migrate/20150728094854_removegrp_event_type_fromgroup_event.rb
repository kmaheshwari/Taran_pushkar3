class RemovegrpEventTypeFromgroupEvent < ActiveRecord::Migration
  def up
  	remove_column :group_event, :grp_event_type
  end

  def down
  end
end
