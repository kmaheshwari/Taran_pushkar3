class CreateGroupEvents < ActiveRecord::Migration
  def change
    create_table :group_events do |t|
      t.string :grp_event_name
      
      t.timestamps
    end
  end
end
