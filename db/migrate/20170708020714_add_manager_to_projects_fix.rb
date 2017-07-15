class AddManagerToProjectsFix < ActiveRecord::Migration
  def change
    remove_foreign_key :projects, :users
    add_column :projects, :manager_id, :integer
  end
end
