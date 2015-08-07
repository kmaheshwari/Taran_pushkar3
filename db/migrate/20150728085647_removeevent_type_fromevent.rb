class RemoveeventTypeFromevent < ActiveRecord::Migration
  def up
  	remove_column :events, :event_type
  end

  def down
  end
end
