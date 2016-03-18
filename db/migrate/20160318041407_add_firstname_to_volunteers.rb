class AddFirstnameToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :first_name, :text
  end
end
