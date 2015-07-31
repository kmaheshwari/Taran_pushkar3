class CreateMemberEvents < ActiveRecord::Migration
  def change
    create_table :member_events do |t|
     
      t.timestamps
    end
  end
end
