class AddAvailabilityIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :availability_id, :integer
  end
end
