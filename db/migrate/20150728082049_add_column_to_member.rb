class AddColumnToMember < ActiveRecord::Migration
  def change
    add_column :members, :comp_name, :string
  end
end
