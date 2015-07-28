class CreateMemberEvents < ActiveRecord::Migration
  def change
    create_table :member_events do |t|
      t.integer :member_id
      t.integer :event_id

      t.timestamps
    end
  end
end
