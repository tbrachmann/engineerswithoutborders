class AddManagerToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :users, index: true
    add_foreign_key :projects, :users
  end
end
