class AddGroupToVolunteer < ActiveRecord::Migration
  def change
    add_column :volunteers, :group, :text
  end
end
