class AddTravelToUser < ActiveRecord::Migration
  def change
    add_column :users, :travel, :string
  end
end
