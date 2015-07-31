class CreateEventWinners < ActiveRecord::Migration
  def change
    create_table :event_winners do |t|
      t.integer :points
      
      t.timestamps
    end
  end
end
