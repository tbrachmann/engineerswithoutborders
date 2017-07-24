class AddDaysToAvailability < ActiveRecord::Migration
  def change
    
    change_column :availabilities, :monday_morning, :boolean, :default => false
    change_column :availabilities, :monday_afternoon, :boolean, :default => false
    change_column :availabilities, :monday_evening, :boolean, :default => false

    change_column :availabilities, :tuesday_morning, :boolean, :default => false
    change_column :availabilities, :tuesday_afternoon, :boolean, :default => false
    change_column :availabilities, :tuesday_evening, :boolean, :default => false

    change_column :availabilities, :wednesday_morning, :boolean, :default => false
    change_column :availabilities, :wednesday_afternoon, :boolean, :default => false
    change_column :availabilities, :wednesday_evening, :boolean, :default => false

    change_column :availabilities, :thursday_morning, :boolean, :default => false
    change_column :availabilities, :thursday_afternoon, :boolean, :default => false
    change_column :availabilities, :thursday_evening, :boolean, :default => false

    change_column :availabilities, :friday_morning, :boolean, :default => false
    change_column :availabilities, :friday_afternoon, :boolean, :default => false
    change_column :availabilities, :friday_evening, :boolean, :default => false

    change_column :availabilities, :saturday_morning, :boolean, :default => false
    change_column :availabilities, :saturday_afternoon, :boolean, :default => false
    change_column :availabilities, :saturday_evening, :boolean, :default => false
    
    change_column :availabilities, :sunday_morning, :boolean, :default => false
    change_column :availabilities, :sunday_afternoon, :boolean, :default => false
    change_column :availabilities, :sunday_evening, :boolean, :default => false

  end
end
