class AddUniqueIndexOnRoles < ActiveRecord::Migration
  def change
    add_index :roles, :name, unique: true
  end
end
