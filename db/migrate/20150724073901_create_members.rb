class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :name
      t.date :dob
      t.string :gender
      t.string :district
      t.string :state
      t.string :schl_club_name

      t.timestamps
    end
  end
end
