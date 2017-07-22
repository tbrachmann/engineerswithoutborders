class DropDesignExperienceUserProject2 < ActiveRecord::Migration
  def change
    drop_table :design_experiences_users
    drop_table :design_experiences_projects
    
    create_table :design_experiences_users, :id => false do |t|
      t.integer :design_experience_id
      t.integer :user_id
    end
    
    create_table :design_experiences_projects, :id => false do |t|
      t.integer :design_experience_id
      t.integer :project_id
    end
  end
end
