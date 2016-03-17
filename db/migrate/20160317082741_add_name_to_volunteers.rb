class AddNameToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :name, :string
  end
end
