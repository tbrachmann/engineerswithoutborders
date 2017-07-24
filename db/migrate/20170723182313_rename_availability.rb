class RenameAvailability < ActiveRecord::Migration
  def change
    rename_table :availability, :availabilities
  end
end
