class CreateCompetetionLevels < ActiveRecord::Migration
  def self.up
    create_table :competetion_levels do |t|
      t.string :comp_name
      t.timestamps
    end
  end
end
