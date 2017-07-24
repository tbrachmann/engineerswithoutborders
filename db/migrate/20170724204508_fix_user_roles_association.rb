class FixUserRolesAssociation < ActiveRecord::Migration
  def change
    remove_column :roles, :user_id, :integer
    add_reference :users, :role, index: true
  end
end
