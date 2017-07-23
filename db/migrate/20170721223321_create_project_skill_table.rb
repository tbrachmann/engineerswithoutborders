class CreateProjectSkillTable < ActiveRecord::Migration
  def change
    create_table :projects_skills , :id => false do |t|
      t.integer :skill_id
      t.integer :user_id
    end
  end
end
