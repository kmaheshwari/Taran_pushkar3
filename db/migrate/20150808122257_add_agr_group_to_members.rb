class AddAgrGroupToMembers < ActiveRecord::Migration
  def change
    add_column :members, :age_group, :string
  end
end
