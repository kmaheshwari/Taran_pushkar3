class CreateMemberGroups < ActiveRecord::Migration
  def change
    create_table :member_groups do |t|
     
      
      t.timestamps
    end
  end
end
