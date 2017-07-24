class CreateConstructionProjectUser < ActiveRecord::Migration
  def change
    create_table :construction_experiences_users, :id => false do |t|
      t.integer :construction_experience_id
      t.integer :user_id
    end
    
    create_table :construction_experiences_projects, :id => false do |t|
      t.integer :construction_experience_id
      t.integer :project_id
    end
  end
end
