class RemoveAvailabilityDaysFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :sunday_availability, :string
    remove_column :users, :monday_availability, :string
    remove_column :users, :tuesday_availability, :string
    remove_column :users, :wednesday_availability, :string
    remove_column :users, :thursday_availability, :string
    remove_column :users, :friday_availability, :string
    remove_column :users, :saturday_availability, :string


  end
end
