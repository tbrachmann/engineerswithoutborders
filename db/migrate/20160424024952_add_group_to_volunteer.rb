class AddGroupToVolunteer < ActiveRecord::Migration
  def change
    add_column :volunteers, :group, :string
  end
end
