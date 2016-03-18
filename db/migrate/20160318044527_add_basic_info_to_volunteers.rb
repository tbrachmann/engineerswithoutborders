class AddBasicInfoToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :last_name, :text
    add_column :volunteers, :phone, :text
    add_column :volunteers, :email, :text
    add_column :volunteers, :city, :text
  end
end
