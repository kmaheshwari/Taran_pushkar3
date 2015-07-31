class CreateMemberGroups < ActiveRecord::Migration
  def change
    create_table :member_groups do |t|
      t.integer :member_id
      t.integer :group_event_id
      t.references :members
      t.references :group_events
      t.timestamps
    end
  end
end
