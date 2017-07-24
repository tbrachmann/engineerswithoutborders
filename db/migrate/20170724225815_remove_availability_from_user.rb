class RemoveAvailabilityFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :availability, :string
  end
end
