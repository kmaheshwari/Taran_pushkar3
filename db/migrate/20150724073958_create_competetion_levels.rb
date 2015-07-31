class CreateCompetetionLevels < ActiveRecord::Migration
  def self.up
    create_table :competetion_levels do |t|
      t.string :age_group
      add_foreign_key(:members, :competetion_levels)
      t.timestamps
    end
  end
end
