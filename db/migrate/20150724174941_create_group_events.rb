class CreateGroupEvents < ActiveRecord::Migration
  def change
    create_table :group_events do |t|
      t.string :grp_event_name
      t.string :grp_event_type

      t.timestamps
    end
  end
end
