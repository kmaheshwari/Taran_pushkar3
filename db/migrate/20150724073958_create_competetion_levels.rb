class CreateCompetetionLevels < ActiveRecord::Migration
  def self.up
    create_table :competetion_levels do |t|
      t.string :age_group
   
      t.timestamps
    end
  end
end
