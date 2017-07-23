class DropDesignExperienceUserProject < ActiveRecord::Migration
  def change
    drop_table :design_experiences_user
    drop_table :design_experiences_project
    
    create_table :design_experiences_users do |t|
      t.integer :design_experience_id
      t.integer :user_id
    end
    
    create_table :design_experiences_projects do |t|
      t.integer :design_experience_id
      t.integer :project_id
    end
  end
end
