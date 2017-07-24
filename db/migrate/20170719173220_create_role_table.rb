class CreateRoleTable < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.belongs_to :user, index: true
      t.string :name, default: nil
    end

    remove_column :users, :role
    #add_foreign_key :users, :roles
    
  end
end
