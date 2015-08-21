class Addftomem < ActiveRecord::Migration
  def up
  	remove_column :members, :age_group
  	add_column :members, :competetion_level_id, :integer
  	add_foreign_key :members, :competetion_levels
  end

  def down
  end
end
