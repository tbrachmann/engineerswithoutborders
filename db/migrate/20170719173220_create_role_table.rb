class CreateRoleTable < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, default: nil
    end

    remove_column :users, :role

  end
end
