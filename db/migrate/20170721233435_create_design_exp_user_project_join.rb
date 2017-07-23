class CreateDesignExpUserProjectJoin < ActiveRecord::Migration
  def change
    create_table :design_experiences_user do |t|
      t.integer :design_experience_id
      t.integer :user_id
    end
    
    create_table :design_experiences_project do |t|
      t.integer :design_experience_id
      t.integer :project_id
    end
  end
end
