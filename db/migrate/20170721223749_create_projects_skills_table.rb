class CreateProjectsSkillsTable < ActiveRecord::Migration
  def change
    create_table :projects_skills , :id => false do |t|
      t.integer :skill_id
      t.integer :project_id
    end
  end
end