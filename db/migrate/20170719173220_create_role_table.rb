class CreateRoleTable < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, default: nil
      t.integer :user_id
    end

    remove_column :users, :role
    add_foreign_key :users, :roles
    
  end
end
