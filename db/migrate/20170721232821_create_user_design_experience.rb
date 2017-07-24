class CreateUserDesignExperience < ActiveRecord::Migration
  def change
    create_table :user_design_experiences do |t|
      t.integer :design_experience_id
      t.integer :user_id
    end
    
    create_table :project_design_experiences do |t|
      t.integer :design_experience_id
      t.integer :project_id
    end
  end
end